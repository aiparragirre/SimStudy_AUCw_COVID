
rm(list=ls())

source("functions/f.sample.R")
source("functions/f.sim.real.R")

library(svyROC)

load("populazioa.RData")


set.seed(100)
sim.des11.fa.real <- f.sim.real(population = populazioa, 
                                response.var = "covidfalle",
                                mystrata = "edad_cat", 
                                mycluster = FALSE,
                                clusters.per.stratum = 0, 
                                n.units = c(375, 375, 375, 375, 500, 500, 500),
                                runs = 500)
save(sim.des11.fa.real, file = "simresults/sim.des11.fa.real.rda")

set.seed(100)
sim.des11.me.real <- f.sim.real(population = populazioa, 
                                response.var = "mala_ev",
                                mystrata = "edad_cat", 
                                mycluster = FALSE,
                                clusters.per.stratum = 0, 
                                n.units = c(375, 375, 375, 375, 500, 500, 500),
                                runs = 500)
save(sim.des11.me.real, file = "simresults/sim.des11.me.real.rda")

set.seed(100)
sim.des11.in.real <- f.sim.real(population = populazioa, 
                                response.var = "ingreso",
                                mystrata = "edad_cat", 
                                mycluster = FALSE,
                                clusters.per.stratum = 0, 
                                n.units = c(375, 375, 375, 375, 500, 500, 500),
                                runs = 500)
save(sim.des11.in.real, file = "simresults/sim.des11.in.real.rda")

set.seed(200)
sim.des21.fa.real <- f.sim.real(population = populazioa,
                                response.var = "covidfalle",
                                mystrata = "tthh", 
                                mycluster = "comarca_osi", 
                                clusters.per.stratum = 2, 
                                n.units = 500,
                                runs = 500)
save(sim.des21.fa.real, file = "simresults/sim.des21.fa.real.rda")

set.seed(200)
sim.des21.me.real <- f.sim.real(population = populazioa,
                                response.var = "mala_ev",
                                mystrata = "tthh", 
                                mycluster = "comarca_osi", 
                                clusters.per.stratum = 2, 
                                n.units = 500,
                                runs = 500)
save(sim.des21.me.real, file = "simresults/sim.des21.me.real.rda")

set.seed(200)
sim.des21.in.real <- f.sim.real(population = populazioa, 
                                response.var = "ingreso",
                                mystrata = "tthh", 
                                mycluster = "comarca_osi", 
                                clusters.per.stratum = 2, 
                                n.units = 500,
                                runs = 500)
save(sim.des21.in.real, file = "simresults/sim.des21.in.real.rda")

set.seed(300)
sim.des31.fa.real <- f.sim.real(population = populazioa, 
                                response.var = "covidfalle",
                                mystrata = "comarca_osi_2", 
                                mycluster = "edad_cat", 
                                clusters.per.stratum = 2, 
                                n.units = 120,
                                runs = 500)
save(sim.des31.fa.real, file = "simresults/sim.des31.fa.real.rda")

set.seed(300)
sim.des31.me.real <- f.sim.real(population = populazioa, 
                                response.var = "mala_ev",
                                mystrata = "comarca_osi_2", 
                                mycluster = "edad_cat", 
                                clusters.per.stratum = 2, 
                                n.units = 120,
                                runs = 500)
save(sim.des31.me.real, file = "simresults/sim.des31.me.real.rda")

set.seed(300)
sim.des31.in.real <- f.sim.real(population = populazioa, 
                                response.var = "ingreso",
                                mystrata = "comarca_osi_2", 
                                mycluster = "edad_cat", 
                                clusters.per.stratum = 2, 
                                n.units = 120,
                                runs = 500)
save(sim.des31.in.real, file = "simresults/sim.des31.in.real.rda")



