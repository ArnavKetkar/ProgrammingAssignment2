## Write a short comment describing this function
library(MASS) ## to find inverse of non-square matrices
makeCacheMatrix <- function(x = matrix()) {
## Initialize the inverse property
    i <- NULL

    ## Method to set the matrix
    set <- function( matrix ) {
            m <<- matrix
            i <<- NULL
    }

    ## Method the get the matrix
    get <- function() {
    	## Return the matrix
    	m
    }

    ## Method to set the inverse of the matrix
    setInverse <- function(inverse) {
        i <<- inverse
    }

    ## Method to get the inverse of the matrix
    getInverse <- function() {
        ## Return the inverse property
        i
    }

    ## Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
         inv <- x$getInverse()

    ## Just return the inverse if its already set
    if( !is.null(inv) ) {
            message("getting cached data")
            return(inv)
    }

    ## Get the matrix from our object
    data <- x$get()

    ## Calculate the inverse using matrix multiplication
    inv <- solve(data) %*% data

    ## Set the inverse to the object
    x$setInverse(inv)

    ## Return the matrix
    inv
}
