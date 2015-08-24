segmentDataset <- function(data,n){
  l <- list()
  sampledDataset <- sample(x = data,size = length(data),replace = FALSE)
  if(length(data)%%n==0){
  for(i in 1:n){
    l[[i]] <- sampledDataset[((length(data)/n)*(i-1)+1):((length(data)/n)*(i-1)+(length(data)/n))]
  }
    return(sapply(X = l,FUN = '[',simplify = TRUE))
  }else{
    m <- length(data)%/%n+1
    for(i in 1:(n-1)){
      l[[i]] <- sampledDataset[(m*(i-1)+1):(m*(i-1)+m)]
    }
    l[[n]] <- sampledDataset[(m*i+1):length(sampledDataset)]
    return(sapply(X = l,FUN = '[',simplify = TRUE))
  }
}