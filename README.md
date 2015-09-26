### Caching the Inverse of a Matrix

This is the second programming assignment for the R Programming with Johns Hopkins / Coursera.

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly. The assignment is to write a pair of functions that
cache the inverse of a matrix.

The repository contains following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.

For this assignment, it is assumed that the matrix supplied is always
invertible.


### Approach

In this assignment we use the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and caches its mean.

The first function, `makeCacheMatrix` creates a special "matrix", which is
really a list containing a function to

1.  setM - set the value of the matrix
2.  getM - get the value of the matrix
3.  cacheI - set the value of the inverse
4.  getI - get the value of the inverse

Below is the example of how this function can be used

<!-- -->

> r = rnorm(100)
> mat1 = matrix(r, nrow=10, ncol=10)
> temp <- makeCacheMatrix(mat1)

The second function cacheSolve returns the inverse from cache, if available,
otherwise it builds the cache and returns the inverse.

Below is the example of how this function can be used

> cacheSolve(temp)
