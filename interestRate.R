ifir <- function(r, f) {
  return ((r-f)/(1+f))
}

drawcfs <- function(cfs) {
  plot(cfs, xlab="Periodo", ylab="y")
  abline(h=c(0))
  title("Fluxo de Caixa")
  count <- 0
  for(i in cfs){
    count <- count + 1
    if(i!=0) { arrows(count,0,count,i,length=0.1,angle=20) }
  }
}

disc <- function(r, n, bop=FALSE) {
  t< -1/(1+r)
  e<- if(bop) {0:(n-1)} else {1:n}
  return(t^e)
}

Fv <- function(Pv, r, n) {
  return (Pv * (1+(r/100))^n)
}

nFv <- function(cfs, r, bop=TRUE) {
  e <- if(bop) {0:(length(cfs)-1)} else {1:(length(cfs))}
  tax <- (1+(r/100))^e
  print(tax)
  return (cfs * tax)
}

Pv <- function(Fv, r, n) {
  return (Fv / (1+(r/100))^n )
}

nPv <- function(cfs, r, bop=TRUE) {
  e <- if(bop) {0:(length(cfs)-1)} else {1:(length(cfs))}
  tax <- (1/((1+(r/100))^e))
  print(tax)
  return (cfs * tax)
}
