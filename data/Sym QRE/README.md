This file creates and solves examples of minimizing the symmetric QRE of two matrices subject to some linear inequalities,
and compare the running time with minimizing the QRE problem with the same constraints. 

The symmetric QRE fundction is defined as

```
sqre(X,Y) := qre(X,Y)+qre(Y,X)
```
