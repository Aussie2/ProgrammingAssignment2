## Put comments here that give an overall description of what your
## functions do

## Why caching, some operations are computationally expensive and so make sencse to do once and store the result in memory for later referal
#one such operation is matrix inversion

#I am not entirely sure how the code works so I will start with the examples given ans see if I can begin to follow it as I hack the code
#I replaced the mean with solve in all cases and it seems to be working


makeCacheMatrix <- function(x = matrix()) {#This function creates a special "matrix" object that can cache its inverse.
	 m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
