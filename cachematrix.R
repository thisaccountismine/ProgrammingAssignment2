## These functions serve to compute the inversion of a matrix.
## 

## This function creates a matrix object that can store its inverse in cache

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL}
  get<-function() x
  setmatrix<-function(solve) m<<- solve
  getmatrix<-function() m
  list(set=set, get=get,
       setmatrix=setmatrix,
       getmatrix=getmatrix)
       

}


## This function inverts the matrix created by makeCacheMatrix, but if the inverse had already been stored in the cache, it retrieves it from there.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m<-x$getmatrix()
  if(!is.null(m)){
    message("retrieving data from cache")
    return (m)}
  matrix <- x$get() 
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
    
    
}
