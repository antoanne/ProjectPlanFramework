#CPM<-c(-10,-50,0,0,0,0,0,0,30,0,30,0,0,220,0,0,130,0,160)
#drawcfs(CPM)

#print(nPv(CPM, 0.1425))
#print(sum(nPv(CPM, 0.1425)))


# exemplo 2
d<-c(1,4,5,7,2,3,1)
suc<-list(c(2,3),
          4,
          c(4,5),
          6,
          7,
          7,
          c(0))

nodes <- cpm(d, suc)

# exemplo 1
# d2<-c(1,5,2,2,2,2,3,2,3,3,2)
# suc2<-list(c(2,3),
#            c(4,5),
#            c(6,7),
#            8,
#            10,
#            8,
#            11,
#            9,
#            10,
#            11,
#            c(0))
# 
# nodes2 <- cpm(d2, suc2)







#names <- c("A", "B", "C", "D")
#M <- matrix(nrow = 4, ncol = 4, byrow = TRUE, data = 0)
#plotmat(M, name=names)
