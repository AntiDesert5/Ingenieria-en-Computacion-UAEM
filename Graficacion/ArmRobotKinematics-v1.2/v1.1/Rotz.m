function T=Rotz(a)

ca = cos(a);
sa = sin(a);

T = [ ca -sa  0  0;
      sa  ca  0  0;
      0  0    1  0;
      0  0    0  1];
