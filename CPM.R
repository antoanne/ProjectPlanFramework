# define a "classe" node
node <- setClass("node",
                 slots = c(d="numeric", name="numeric",
                           es="numeric", eft="numeric",
                           lst="numeric", lft="numeric",
                           suc="vector"),
                 prototype=list(d   = 0, name = 0,
                                es  = 0, eft = 0,
                                lst = 0, lft = 0,
                                suc = c(0))
                )

# d = vetor de duração das atividades
# suc = vetor de sucessores
# return = vetor com nodes já processados
cpm <- function(d, suc) {
  #cria a lista de nodes
  nodes <- c()
  
  # inicia cada node com sua respectiva densidade
  # define os sucessores
  for (i in 1:length(suc)) {
    nodes <- c(nodes, node(d=d[i], name=i, suc=suc[i]))
       
  }
  
  # define EFT do 1º node
  slot(nodes[[1]], "eft") <- slot(nodes[[1]], "d")
  
  #slot(nodes[[1]], "lft") <- slot(nodes[[1]], "d")
  
  # define em cada node os valores de ES e EFT
  for (i in 1:length(nodes)-1) {
    #print(c(">>>", i))
    for (s in suc[i]) {
      for (n in s) {
        #print(c(">>>>>>>>>",n))
        slot(nodes[[n]], "es") <- max(slot(nodes[[n]], "es"), slot(nodes[[i]], "eft"))
        slot(nodes[[n]], "eft") <- (slot(nodes[[n]], "es") + slot(nodes[[n]], "d"))
      }
    }
  }
  
  # define LFT e LST do 1º node
  slot(nodes[[length(nodes)]], "lft") <- slot(nodes[[length(nodes)]], "eft")
  slot(nodes[[length(nodes)]], "lst") <- slot(nodes[[length(nodes)]], "eft") - slot(nodes[[length(nodes)]], "d")
  
  # define (de trás para frente) os valores de LFT e LST para cada node
  for (i in (length(nodes)-1):1) {
    # print(c(">>>", i))
    for (s in suc[[i]]) {
      # print(s)
      if(slot(nodes[[i]], "lft") == 0) {
        slot(nodes[[i]], "lft") <- slot(nodes[[s]], "lst")
      } else {
        slot(nodes[[i]], "lft") <- min(slot(nodes[[s]], "lst"), slot(nodes[[i]], "lft"))
      }
    }
    slot(nodes[[i]], "lst") <- slot(nodes[[i]], "lft") - slot(nodes[[i]], "d")
  }
  return(nodes)
}

all.schedules.count <- function(nodes) {
  total <- 1
  for (i in 1:length(nodes)) {
    total <- total * ( slot(nodes[[i]], "lst") - slot(nodes[[i]], "es") + 1 )
  }
  return( total )
}
