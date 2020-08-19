import sys

DESTINATIONS = {
    '':   '000',
    'M':  '001',
    'D':  '010',
    'MD': '011',
    'A':  '100',
    'AM': '101',
    'AD': '110',
    'AMD': '111'
}

JUMPTARGETS = {
    '': '000',
    'JGT': '001',
    'JEQ': '010',
    'JGE': '011',
    'JLT': '100',
    'JNE': '101',
    'JLE': '110',
    'JMP': '111'
}

COMPUTATIONS = {
    '0': '0101010',
    '1': '0111111',
    '-1': '0111010',
    'D': '0001100',
    'A': '0110000',
    '!D': '0001101',
    '!A': '0110001',
    '-D': '0001111',
    '-A': '0110011',
    'D+1': '0011111',
    'A+1': '0110111',
    'D-1': '0001110',
    'A-1': '0110010',
    'D+A': '0000010',
    'D-A': '0010011',
    'A-D': '0000111',
    'D&A': '0000000',
    'D|A': '0010101',
    'M': '1110000',
    '!M': '1110001',
    '-M': '1110011',
    'M+1': '1110111',
    'M-1': '1110010',
    'D+M': '1000010',
    'D-M': '1010011',
    'M-D': '1000111',
    'D&M': '1000000',
    'D|M': '1010101'
}

def makeSymbolTable():
    global SYMBOLS
    SYMBOLS = {
    'SP': '0',
    'LCL': '1',
    'ARG': '2',
    'THIS': '3',
    'THAT': '4',
    'SCREEN': '16384',
    'KBD': '24576',
    }
    for i in range(16):
        SYMBOLS['R'+str(i)] = str(i)



def isSymbol(s):
    validSymbols = "_.$:"
    if len(s) < 1:
        return False
    if s[0].isdigit():
        return False
    if s not in SYMBOLS:
        for c in s:
            if not c.isalnum():
                if not c in validSymbols:
                    return False
    return True

def isConstant(s):
    if s.isdigit():
        if len(s) >= 1 and len(s) <=5:
            t = int(s)
            if t >= 0 and t <= 32767:
                return True
    return False

def fail(msg, srcline, srclinenumber):
    print >> sys.stderr, "%s from %s at %s" %(msg, srcline, srclinenumber)
    sys.exit(1)


def parseLine(s, lineNum):
    srcLine = s
    #if its a comment
    comment = s.find("//")
    if comment != -1:
        s = s[0:comment]
    s = s.strip()
    if s == '':
        return None

    #if its an a instruction
    if s[0] == '@':
        s = s[1:]
        s = s.strip()
        if isSymbol(s) or isConstant(s):
            return ('A_INSTRUCTION', s, srcLine, lineNum)
        fail("not a valid A instruction", srcLine, lineNum)
    #if its a label
    if s[0] == '(':
        label = s.find(')')
        s=s[1:label].strip()
        if isSymbol(s):
            return ('L_INSTRUCTION', s, srcLine, lineNum)
        fail("not a valid L instruction", srcLine, lineNum)

    #if its none of the above it must be a C
    destination = s.find('=')
    dest = ''
    if destination != -1:
        dest = s[0:destination].strip()
        s = s[destination+1:]
        if dest not in DESTINATIONS or dest == "":
            fail("not a valid destination", srcLine, lineNum)

    targets = s.find(';')
    jump = ''
    if targets != -1:
        jump = s[targets+1:].strip()
        s = s[0:targets]
        if jump not in JUMPTARGETS or jump == "":
            fail("not a jump target", srcLine, lineNum)

    s = s.strip()
    if s in COMPUTATIONS:
        return ('C_INSTRUCTION', dest, s, jump, srcLine, lineNum)
    else:
        fail("not a valid C instruction", srcLine, lineNum)


def main():
    #initializing everything
    if len(sys.argv) != 2 or sys.argv[1][-4:] != ".asm":
        print ("command line arguement should be name of input file ending in a .asm")
        return
    total = []
    makeSymbolTable()
    fin = open(sys.argv[1], 'r')
    fout = open(sys.argv[1][0:-4] + ".hack", 'w')
    lineCount = 1

    #parse everything
    for line in fin:
        parsed = parseLine(line, lineCount)
        lineCount += 1
        if parsed != None:
            total.append(parsed)
            

    #translate to binary
    #first pass
    lineCount = -1
    lInstCount = 0
    for line in total:
        lineCount+=1
        if line[0][0] == 'L':
            SYMBOLS[line[1]] = str(lineCount-lInstCount)
            lInstCount += 1
    #second pass
    #print SYMBOLS
    symbolCount = 16
    for line in total:
        if line[0][0] == 'A':
            if isConstant(line[1]):
                num = int(line[1])
                num = bin(num)[2:].zfill(15)
                fout.write('0' + str(num)+"\n")
            else:
                if line[1] not in SYMBOLS:
                    SYMBOLS[line[1]] = symbolCount
                    symbolCount += 1
                    #print SYMBOLS
                if line[1] in SYMBOLS:
                    num = int(SYMBOLS[line[1]])
                    num = bin(num)[2:].zfill(15)
                    fout.write('0' + str(num)+"\n")
        elif line[0][0] == 'C':
            fout.write("111"+COMPUTATIONS[line[2]]+DESTINATIONS[line[1]]+JUMPTARGETS[line[3]] + "\n")



    fin.close()
    fout.close()


if __name__ == '__main__':
    main()