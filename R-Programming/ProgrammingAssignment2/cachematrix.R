## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function can create special matrix which can be inversed
## easily using cacheSolve function. It also cache the inversed
## matrix, if it is calculated.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(inv) m <<- inv
        getinv <- function() m
        list(set = set, get = get, setinv = setinv, getinv = getinv)

}


## Write a short comment describing this function
## This function can calculate the inverse of the matrix that is 
## returned by the makeCacheMatrix. If the inverse is already 
## calculated, it retrieve the inverse result from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}















