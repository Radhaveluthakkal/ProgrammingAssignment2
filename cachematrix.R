## This particular function will take the inverse of a matrix as computation will take long time to calculate the inverse
## of matrix repeatedly . Also, in this function the matrix value is not changing hence we preferred to cache the inverse matrix.
## and leverage it when required again rather computing it again . 

## In this function we have used <<- operator which is used to assign the matrix value to an object into a object 
## that is different from current environment.Below code will create a matrix "MakeCacheMatrix" to set the value of the matrix
## , Set inverse of the martix and GET the inverse too.



makeCacheMatrix <- function(x = matrix()) {m <- NULL
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


##This function computes the inverse of the special "matrix"returned by 
## makecacheMatrix above.If the inverse has alaready been calculated 
## and the matrix is already created the it will return to NULL by skipping the computation otherwise
## it inverse the Matrix and stores the value in the cache via the Setsolve function.


cacheSolve <- function(x, ...) { m <- x$getsolve()
if(!is.null(m)) {
  message("getting cached data")
  return(m)
} #computes inverses of a matrix if it is a new matrix
data <- x$get()
m <- solve(data, ...)
x$setsolve(m)
m
## Return a matrix that is the inverse of 'x'
}

y<-matrix(4:7, 2, 2)
t<-makeCacheMatrix(y)
cacheSolve(t)


