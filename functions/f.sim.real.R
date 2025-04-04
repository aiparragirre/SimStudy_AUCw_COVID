
f.sim.real <- function(population, response.var,
                       mystrata, mycluster = FALSE,
                       clusters.per.stratum = 0, n.units,
                       runs = 500){
  
  out <- list()
  seeds <- sample(1:1000000, size = runs, replace = FALSE)
  out$seeds <- seeds
  
  if(response.var == "mala_ev"){
    formula <- mala_ev ~ edad_cat + sexo + charlson_13+n_vac_pos+tumor+fibrosis_quis+enf_pulmon_intersticial+charlson_4+ charlson_5+tto_diureticos_basal+tto_esteroides_basal+cardiopatia+dm
  } else {
    if(response.var == "ingreso"){
      formula <- ingreso ~ edad_cat + sexo +n_vac_pos+ charlson_4+eii+enf_hepatica+dm+ charlson_12+charlson_13 +hta+dislipemia+enf_pulmon_intersticial+tumor+cardiopatia+fallo_cardiaco+tto_diureticos_basal+tto_esteroides_basal+tto_broncodilatadores_basal+tto_inmunosupresores_basal
    } else {
      if(response.var == "covidfalle"){
        formula <- covidfalle ~ sexo + edad_cat + n_vac_pos + charlson_3 + charlson_4 + charlson_5 + enf_hepatica + dm + charlson_12 + charlson_13 + fibrosis_quis + enf_pulmon_intersticial + tumor + cardiopatia + fallo_cardiaco + tto_diureticos_basal + tto_esteroides_basal
      }
    }
  }
  
  pop.eredua <- glm(formula = formula, family = "binomial", data = population)
  auc.true <- suppressMessages(pROC::roc(pop.eredua$y, pop.eredua$fitted)$auc[1])
  
  
  def.s <- f.sample(population = population, 
                    strata = mystrata, 
                    cluster = mycluster, 
                    clusters.per.stratum = clusters.per.stratum, 
                    n.units = n.units)
  m.y <- m.w <- m.phat <- matrix(NA, nrow = nrow(def.s), ncol = runs)
  colnames(m.y) <- colnames(m.w) <- colnames(m.phat) <- paste0("r = ", 1:runs)
  rm(def.s)
  
  unwm.wauc <- unwm.unwauc <- unw.auc <- w.auc <- pop.auc <- rep(NA, runs)
  
  
  out$args <- list()
  out$args$response.var <- response.var
  out$args$formula <- formula
  out$args$strata <- mystrata
  out$args$cluster <- mycluster
  out$args$clusters.per.stratum <- clusters.per.stratum
  out$args$n.units <- n.units
  
  
  
  for(r in 1:runs){
    
    r.time.start <- Sys.time()
    
    cat(" >>> r = ", r, " >>> \n\n")
    
    set.seed(seeds[r])
    
    # Lagina
    s <- f.sample(population = population, 
                  strata = mystrata, 
                  cluster = mycluster, 
                  clusters.per.stratum = clusters.per.stratum, 
                  n.units = n.units)
    
    
    
    # Design
    if(mycluster == FALSE){
      cluster.formula <- as.formula(paste0("~",1))
    } else {
      cluster.formula <- as.formula(paste0("~",mycluster))
    }
    strata.formula <- as.formula(paste0("~",mystrata))
    weights.formula <- as.formula("~sampling.weights")
    mydesign <- survey::svydesign(ids = cluster.formula, 
                                  strata = strata.formula, 
                                  weights = weights.formula,
                                  data = s,
                                  nest = TRUE)
    
    # Fit the model
    unw.model <- glm(formula, data = s, family = "binomial")
    model <- survey::svyglm(formula, design = mydesign, family = "quasibinomial")
    
    
    # Weighted and unweighted estimates of the AUC
    unwm.unwauc[r] <- suppressMessages(pROC::roc(unw.model$y, unw.model$fitted)$auc[1])
    unw.auc[r] <- suppressMessages(pROC::roc(model$y, model$fitted)$auc[1])
    w.auc[r] <- svyROC::wauc(response.var = model$y, phat.var = model$fitted, weights.var = s$sampling.weights)$AUCw
    unwm.wauc[r] <- svyROC::wauc(response.var = unw.model$y, phat.var = unw.model$fitted, weights.var = s$sampling.weights)$AUCw
    
    # Save sample information
    m.y[,r] <- unw.model$y
    m.phat[,r] <- unw.model$fitted
    m.w[,r] <- s$sampling.weights
    

    r.time.end <- Sys.time()
    cat(" --> Total run time: ", as.numeric(difftime(r.time.end, r.time.start, units="secs")), " secs\n\n")
    
    
    
  }
  

  out$sample.info <- list()
  out$sample.info$y <- m.y
  out$sample.info$w <- m.w
  out$sample.info$phat <- m.phat
  
  out$auc <- list()
  out$auc$pop.model.true <- auc.true
  out$auc$unwm.unwauc <- unwm.unwauc
  out$auc$unwm.wauc <- unwm.wauc
  out$auc$wm.unwauc <- unw.auc
  out$auc$wm.wauc <- w.auc

   
  return(out)
    
}

