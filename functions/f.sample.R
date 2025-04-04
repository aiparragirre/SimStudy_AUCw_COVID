

f.sample <- function(population, strata, cluster = FALSE,
                     clusters.per.stratum = 0, n.units){
  
  #n.units must be a vector of length #strata in one-stage sampling
  #n.units must be a number indicating the number of units to be sampled from each cluster
  
  population[,"sampling.weights"] <- rep(1,nrow(population))
  population[,"sample"] <- rep(FALSE,nrow(population))
  
  if(cluster==FALSE){
    
    # one-stage
    table.strata <- table(population[,strata])
    strata.names <- names(table.strata)
    Nh <- as.numeric(table.strata)
    
    for(h in 1:length(strata.names)){
      id.h <- sample(1:Nh[h], n.units[h])
      population[which(population[,strata]==strata.names[h])[id.h],"sample"] <- TRUE
      population[which(population[,strata]==strata.names[h])[id.h],"sampling.weights"] <- Nh[h]/n.units[h]
    }
    
    sample <- population[population$sample==TRUE,-which(colnames(population) == "sample")]
    
  } else {
    
    #population[,"selected.cluster"] <- rep(FALSE,nrow(population))
    
    # two-stage
    table.strata <- table(population[,strata])
    strata.names <- names(table.strata)
    
    if(length(clusters.per.stratum)==1){
      clusters.per.stratum <- rep(clusters.per.stratum,length(strata.names))
    }
    
    for(h in 1:length(strata.names)){
      
      strata.name <- names(table(population[,strata]))[h]
      clusters.in.stratum <- length(which(table(population[which(population[,strata]==strata.names[h]),cluster])!=0))   
      id.cluster <- sample(1:clusters.in.stratum, clusters.per.stratum[h])
      selected.cluster.names <- names(which(table(population[which(population[,strata]==strata.names[h]),cluster])!=0))[id.cluster]
      
      for(c in 1:length(selected.cluster.names)){
        Nh.clus.size <- nrow(population[which(population[,strata]==strata.name & population[,cluster]==selected.cluster.names[c]),])
        id.selected <- sample(1:Nh.clus.size,n.units)
        population[which(population[,strata]==strata.name & population[,cluster]==selected.cluster.names[c])[id.selected],"sample"] <- TRUE
        population[which(population[,strata]==strata.name & population[,cluster]==selected.cluster.names[c])[id.selected],"sampling.weights"] <- (Nh.clus.size/n.units)*(clusters.in.stratum/clusters.per.stratum[h])
      }
      
    }
    
    sample <- population[population$sample==TRUE,-which(colnames(population) == "sample")]
    
  }
  
  return(sample)
  
}
