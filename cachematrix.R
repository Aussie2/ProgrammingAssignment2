## Put comments here that give an overall description of what your
## functions do

## Why caching, some operations are computationally expensive and so make sencse to do once and store the result in memory for later referal
#one such operation is matrix inversion

#I am not entirely sure how the code works so I will start with the examples given ans see if I can begin to follow it as I hack the code



makeCacheMatrix <- function(x = matrix()) {#This function creates a special "matrix" object that can cache its inverse.
	 m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}


## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {## Return a matrix that is the inverse of 'x'
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
