cat("\f")

#print(ifir(0.1425, 0.0759))
#drawcfs(c(-2000,rep(1000, time=11)))
#print(disc(0.124, 12))
#drawcfs(disc(0.124, 12))

#y<-c(-2000,rep(1000, time=11))
#d<-disc(0.0124, 12)
#d2<-disc(0.0124, 12, TRUE)
#z<-d*y
#z2<-d2*y
#print(z)
#print(z2)
#drawcfs(z2)

#print(nfv(c(200,200,200,200,200,200), 5, FALSE))
#print(nfv(c(-350,100,200,150,75), 5, FALSE))

#cat(rep("_", 30), "\n")

#print(npv(c(-350,100,200,150,75), .05, TRUE))
#print(npv(c(-350,100,200,150,75), .05, FALSE))

#npv(c(0,0,0,0,0,0,0,0,0,10000), 5, FALSE)


print(Fv(1000, 1.2478, 0))
print(Fv(1000, 1.2478, 1))
print(Fv(1000, 1.2478, 2))
print(Fv(1000, 1.2478, 3))

print(nFv(c(1000, 1000, 1000, 1000), 1.2478, TRUE))


print(Pv(1000, 1.2478, 0))
print(Pv(1012.478, 1.2478, 1))
print(Pv(1025.112, 1.2478, 2))
print(Pv(1037.903, 1.2478, 3))

print(nPv(c(1000.000, 1012.478, 1025.112, 1037.903), 1.2478, TRUE))
