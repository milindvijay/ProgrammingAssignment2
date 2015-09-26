## Second programming assignment for caching the inverse of
## a matrix using lexical scoping of R. The assignment includes
## two functions makeCacheMatrix and cacheSolve.

## This function creates a special "matrix" object that can cache its inverse. It is assumed
## that the argument is always a sqaure matrix that can be inversed

makeCacheMatrix <- function(x = matrix()) {
     
     # Default cache to NULL
     cache <- NULL
     as.numeric(cache)
     # Store a matrix
     setM <- function(y){
          x <<- y
          
          ## Matrix is changed. Flush the cache
          cache <<- NULL
     }
     
     # Return storerd matrix
     getM <- function() {
          x
     }
     
     # Cache the inverse
     cacheI <- function(inverse) {
          cache <<- inverse
     }
     
     # Get Inverse
     getI <- function() {
          cache
     }
     
     # Return a list of functions
     list(setM = setM, getM = getM, cacheI = cacheI, getI = getI)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), 
##then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
     ## Get cached value of the inverse
     i <- x$getI()
     
     # Return if cache is not NULL
     if(!is.null(i)) {
          message("Getting cached inverse...")
          return(i)
     }
     
     # If cache is NULL then get the matrix, calculate inverse and store in cache.
     m <- x$getM()
     i <- solve(m)
     message("Caching the inverse...")
     x$cacheI(i)
     
     #Return the inverse
     return(i)
}
