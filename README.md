---

# Linear Discriminant Analysis (LDA) in R

This repository contains R code for implementing Linear Discriminant Analysis (LDA) on two classes, `C1` and `C2`. LDA is a technique used for dimensionality reduction and classification by finding the linear combination of features that best separate different classes.

## Code Overview

### Data Preparation

Two classes, `C1` and `C2`, are defined with sample data. 

```R
C1 <- cbind(c(1,2,3,4,5), c(3,6,9,1,5))
C2 <- cbind(c(11,22,33), c(23,45,67))
```

### Calculating Class Means

Mean vectors for each class and the total mean are calculated.

```R
c1_mean <- colMeans(C1)
c2_mean <- colMeans(C2)
data <- rbind(C1, C2)
data_mean <- colMeans(data)
```

### Between-Class and Within-Class Variance

Between-class variance `S_theta` and within-class variance `Sw` are computed.

```R
S_theta1 <- ncol(C1) * (as.matrix(c1_mean - data_mean) %*% t(c1_mean - data_mean))
S_theta2 <- ncol(C2) * (as.matrix(c2_mean - data_mean) %*% t(c2_mean - data_mean))
S_theta <- S_theta1 + S_theta2

C1_meandeviation <- C1 - matrix(rep(t(c1_mean), nrow(C1)), ncol = ncol(c1_mean), byrow = TRUE)
Sw1 <- t(C1_meandeviation) %*% C1_meandeviation

C2_meandeviation <- C2 - matrix(rep(t(c2_mean), nrow(C2)), ncol = ncol(c2_mean), byrow = TRUE)
Sw2 <- t(C2_meandeviation) %*% C2_meandeviation

Sw <- Sw1 + Sw2
```

### Finding Eigen Vectors

Eigenvalues and eigenvectors are calculated using the generalized eigenvalue problem.

```R
eig <- eigen(solve(Sw) %*% S_theta)
```

### Projected Data

Projected data for each class using the calculated eigenvalues and eigenvectors.

```R
print("Projected vector of C1 is given by : ")
print(C1 %*% eig$vectors[,1])

print("Projected vector of C2 is given by : ")
print(C2 %*% eig$vectors[,1])
```

## Running the Code

1. Clone the repository.
2. Open the R script (`LDA.R`) in your preferred R environment.
3. Run the script to perform LDA on the provided classes.

---
