## Functions that cache the inverse of a matrix

## Usage example:
## > source('cachematrix.R')
## > m <- makeCacheMatrix(matrix(c(4, 0, 0, 4), c(2, 2)))
## > cacheSolve(m)
##       [,1] [,2]
## [1,]  0.25  0.0
## [2,]  0.0   0.25



## Create a special "matrix", which is a list containing
## a function to
##   - set the value of the matrix
##   - get the value of the matrix
##   - set the value of the inverse matrix
##   - get the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
        I <- NULL
        set <- function(y) {
                x <<- y
                Inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inv) I <<- inv
        getinverse <- function() I
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## Calculate the inverse of the special "matrix" created with the above
## function, reusing cached result if it is available

cacheSolve <- function(x, ...) {
        I <- x$getinverse()
        if(!is.null(I)) {
                message("getting cached data")
                return(I)
        }
        data <- x$get()
        I <- solve(data, ...)
        x$setinverse(I)
        I
}
