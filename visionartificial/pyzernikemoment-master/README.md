pyzernikemoment
===============

###1. Introduction

In short, pyzernikemoment is a python module to find the Zernike moments for an N x N binary ROI, and the [MATLAB version](http://www.mathworks.com/matlabcentral/fileexchange/38900-zernike-moments) is written by Amir Tahmasbi.

###2. Install

This package uses distutils, which is the default way of installing python modules. To install in your home directory, securely run the following:

```
git clone https://github.com/primetang/pyzernikemoment.git
cd pyzernikemoment
[sudo] python setup.py install
```

Or directly through `pip` to install it:

```
[sudo] pip install pyzernikemoment
```

###3. Usage

I think this is a [good example](https://github.com/primetang/pyzernikemoment/tree/master/example) for the usage of pyzernikemoment.

You can also run the example by run the following:

```
cd example
python test_example.py
```

The follow is the result, where `A` is the amplitude of the moment, and `Phi` is the phase.

![](https://github.com/primetang/pyzernikemoment/blob/master/example/res.png)

