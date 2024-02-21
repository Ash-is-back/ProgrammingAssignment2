## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that can cache its inverse.
## It takes an optional argument x, which is a matrix.


makeCacheMatrix <- function(x = matrix()) {
    ## Initialize a variable to store the cached inverse
    inv <- NULL
    
    ## Define a function to set the matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL  # Invalidate the cache when the matrix is updated
    }
    
    ## Define a function to get the matrix
    get <- function() x
    
    ## Define a function to get the cached inverse if available; otherwise, compute it
    getInverse <- function() {
        if (!is.null(inv)) {
            message("Getting cached inverse")
            return(inv)
        }
        message("Calculating inverse")
        inv <<- solve(x)
        inv
    }
    
    ## Return a list of functions
    list(set = set,
         get = get,
         getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
    ## Check if the input is a valid "matrix" object created by makeCacheMatrix
    if (!is.list(x) || !all(c("set", "get", "getInverse") %in% names(x))) {
        stop("Input is not a valid 'matrix' object created by makeCacheMatrix")
    }
    
    ## Get the cached inverse if available; otherwise, compute it
    x$getInverse()
}