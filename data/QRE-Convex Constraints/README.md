DDS accepted not just QRE constraints, but also many other types of convex constraints. This folder contains prblems with QRE constraints 
combined with other classes of convex ptoblems such as linear prgramming, SOCP, hyperbolic pgramming, and power cone programming. The ``mat`` files 
are in the format of DDS.

To solve the problem for each data file, use the following code:

```
problem_name='...';
load(problem_name);
[x,y,info]=DDS(c,A,b,cons);

```
