This file is for using DDS to solve the nearest correlation matrix problem in the quantum sense. The optimization problem is 

$$ \min  \ \ qre(M,Y)  \ \ \  \text{s.t. } \ \ \text{Diag}(Y) = 1, $$

where $M$ is a positive definite matrix. In the file, by specifying the varible ``side``, the code creates a random matrix $M$ and solves the problem. 
