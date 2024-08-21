![INFORMS Journal on Computing Logo](https://INFORMSJoC.github.io/logos/INFORMS_Journal_on_Computing_Header.jpg)

# Efficient Implementation of Interior-Point Methods for Quantum Relative Entropy

This project is distributed in association with the [INFORMS Journal on
Computing](https://pubsonline.informs.org/journal/ijoc) under the [MIT License](LICENSE).

The software and data in this repository are associated with the paper [Efficient Implementation of Interior-Point Methods for Quantum Relative Entropy](https://doi.org/10.1287/ijoc.2024.0570) by Mehdi Karimi and Levent Tuncel. 

The snapshot is based on 
[this SHA](https://github.com/mehdi-karimi-math/DDS/commit/410926815989c58da14503b9041d32843c331ba8) 
in the development repository. 

**Important: This code is being developed on an on-going basis at 
https://github.com/mehdi-karimi-math/DDS. Please go there if you would like to
get a more recent version or would like support**

## Cite

To cite the contents of this repository, please cite both the paper and this repo, using their respective DOIs.

https://doi.org/10.1287/ijoc.2024.0570

https://doi.org/10.1287/ijoc.2024.0570.cd

Below is the BibTex for citing this snapshot of the repository.

```
@misc{DDS2.2,
  author =        {Mehdi Karimi and Levent Tuncel},
  publisher =     {INFORMS Journal on Computing},
  title =         {{Efficient Implementation of Interior-Point Methods for Quantum Relative Entropy}},
  year =          {2024},
  doi =           {10.1287/ijoc.2024.0570.cd},
  url =           {https://github.com/INFORMSJoC/2024.0570},
  note =          {Available for download at https://github.com/INFORMSJoC/2024.0570},
}  
```

## Description

Domain-Driven Solver (DDS) is a MATLAB-based software package for convex optimization problems in Domain-Driven form. The current version of DDS accepts every combination of the following function/set constraints: 
- Symmetric cones (LP, SOCP, and SDP)
- Quadratic constraints that are SOCP representable 
- Direct sums of an arbitrary collection of 2-dimensional convex sets defined as the epigraphs of univariate convex
functions (including as special cases geometric programming and entropy programming)
- Generalized power cone
- Epigraphs of matrix norms (including as a special case minimization of nuclear norm over a linear subspace)
- Vector relative entropy
- Quantum entropy and quantum relative entropy
- Hyperbolic polynomials

DDS is a practical implementation of the infeasible-start primal-dual algorithm designed and analyzed in [this paper](https://arxiv.org/abs/1804.06925). 

DDS 2.2 is released in Dec 2023, with extensive update for quantum relative entropy (QRE) programming. The current version can solve much larger instances of QRE programming. Please see [this paper](https://arxiv.org/abs/2312.07438).

## Installation 

To use DDS, the user can follow these steps:

- run MATLAB in the directory DDS;
- run the m-file `DDS_startup.m`.
-  (optional) run the prepared small examples `DDS_example_1.m` and `DDS_example_2.m`.

The prepared examples contain many set constraints accepted by DDS and running them without error indicates that DDS is ready to use. There is a directory `Text_Examples` in the DDS package which includes many examples on different classes of convex optimization problems. 

## How to use DDS

The command in MATLAB that calls DDS is 
```
[x,y,info]=DDS(c,A,b,cons,OPTIONS);
``` 

**Input Arguments:**
- `cons`:  A cell array that contains the information about the type of constraints. 
- `c,A,b`: Input data for DDS: `A` is the coefficient matrix, `c` is the objective vector, `b` is the RHS vector (i.e., the shift in the definition of the convex domain D). 
- `OPTIONS` (optional): An array which contains information about the tolerance  and initial points.  

**Output Arguments:**
- `x`: Primal point. 
- `y`: Dual point which is a cell array. Each cell contains the dual solution for the constraints in the corresponding cell  in `A`. 
- `info`: A structure array containing performance information such as `info.time`, which returns the CPU time for solving the problem. 

To see how to define `c,A,b,cons` and how to add different types of set/function constraints, please see the [users' guide](DDS_users_guide_V2.1.pdf). 

## Ongoing Development

This code is being developed on an on-going basis at the author's
[Github site](https://github.com/mehdi-karimi-math/DDS).

## Support

For support in using this software, submit an
[issue](https://github.com/mehdi-karimi-math/DDS/issues/new).
