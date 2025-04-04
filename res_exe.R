
rm(list=ls())


load("simresults/sim.des11.fa.real.rda")
load("simresults/sim.des21.fa.real.rda")
load("simresults/sim.des31.fa.real.rda")
load("simresults/sim.des11.me.real.rda")
load("simresults/sim.des21.me.real.rda")
load("simresults/sim.des31.me.real.rda")
load("simresults/sim.des11.in.real.rda")
load("simresults/sim.des21.in.real.rda")
load("simresults/sim.des31.in.real.rda")



# Boxplots ----------------------------------------------------------------


pdf(file = "simresults/sim.n1.real.final.pdf", width = 8, height = 11)

par(mfrow=c(3,3))

boxplot(list(unw = sim.des11.fa.real$auc$unwm.unwauc - sim.des11.fa.real$auc$pop.model.true,
             w = sim.des11.fa.real$auc$unwm.wauc - sim.des11.fa.real$auc$pop.model.true,
             unw = sim.des11.fa.real$auc$wm.unwauc - sim.des11.fa.real$auc$pop.model.true,
             w = sim.des11.fa.real$auc$wm.wauc - sim.des11.fa.real$auc$pop.model.true),
        main = "Death - D1", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)

boxplot(list(unw = sim.des21.fa.real$auc$unwm.unwauc - sim.des21.fa.real$auc$pop.model.true,
             w = sim.des21.fa.real$auc$unwm.wauc - sim.des21.fa.real$auc$pop.model.true,
             unw = sim.des21.fa.real$auc$wm.unwauc - sim.des21.fa.real$auc$pop.model.true,
             w = sim.des21.fa.real$auc$wm.wauc - sim.des21.fa.real$auc$pop.model.true),
        main = "Death - D2", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)

boxplot(list(unw = sim.des31.fa.real$auc$unwm.unwauc - sim.des31.fa.real$auc$pop.model.true,
             w = sim.des31.fa.real$auc$unwm.wauc - sim.des31.fa.real$auc$pop.model.true,
             unw = sim.des31.fa.real$auc$wm.unwauc - sim.des31.fa.real$auc$pop.model.true,
             w = sim.des31.fa.real$auc$wm.wauc - sim.des31.fa.real$auc$pop.model.true),
        main = "Death - D3", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)


boxplot(list(unw = sim.des11.me.real$auc$unwm.unwauc - sim.des11.me.real$auc$pop.model.true,
             w = sim.des11.me.real$auc$unwm.wauc - sim.des11.me.real$auc$pop.model.true,
             unw = sim.des11.me.real$auc$wm.unwauc - sim.des11.me.real$auc$pop.model.true,
             w = sim.des11.me.real$auc$wm.wauc - sim.des11.me.real$auc$pop.model.true),
        main = "Adverse evolution - D1", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)

boxplot(list(unw = sim.des21.me.real$auc$unwm.unwauc - sim.des21.me.real$auc$pop.model.true,
             w = sim.des21.me.real$auc$unwm.wauc - sim.des21.me.real$auc$pop.model.true,
             unw = sim.des21.me.real$auc$wm.unwauc - sim.des21.me.real$auc$pop.model.true,
             w = sim.des21.me.real$auc$wm.wauc - sim.des21.me.real$auc$pop.model.true),
        main = "Adverse evolution - D2", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)

boxplot(list(unw = sim.des31.me.real$auc$unwm.unwauc - sim.des31.me.real$auc$pop.model.true,
             w = sim.des31.me.real$auc$unwm.wauc - sim.des31.me.real$auc$pop.model.true,
             unw = sim.des31.me.real$auc$wm.unwauc - sim.des31.me.real$auc$pop.model.true,
             w = sim.des31.me.real$auc$wm.wauc - sim.des31.me.real$auc$pop.model.true),
        main = "Adverse evolution - D3", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)


boxplot(list(unw = sim.des11.in.real$auc$unwm.unwauc - sim.des11.in.real$auc$pop.model.true,
             w = sim.des11.in.real$auc$unwm.wauc - sim.des11.in.real$auc$pop.model.true,
             unw = sim.des11.in.real$auc$wm.unwauc - sim.des11.in.real$auc$pop.model.true,
             w = sim.des11.in.real$auc$wm.wauc - sim.des11.in.real$auc$pop.model.true),
        main = "Hospital admission - D1", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)

boxplot(list(unw = sim.des21.in.real$auc$unwm.unwauc - sim.des21.in.real$auc$pop.model.true,
             w = sim.des21.in.real$auc$unwm.wauc - sim.des21.in.real$auc$pop.model.true,
             unw = sim.des21.in.real$auc$wm.unwauc - sim.des21.in.real$auc$pop.model.true,
             w = sim.des21.in.real$auc$wm.wauc - sim.des21.in.real$auc$pop.model.true),
        main = "Hospital admission - D2", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)

boxplot(list(unw = sim.des31.in.real$auc$unwm.unwauc - sim.des31.in.real$auc$pop.model.true,
             w = sim.des31.in.real$auc$unwm.wauc - sim.des31.in.real$auc$pop.model.true,
             unw = sim.des31.in.real$auc$wm.unwauc - sim.des31.in.real$auc$pop.model.true,
             w = sim.des31.in.real$auc$wm.wauc - sim.des31.in.real$auc$pop.model.true),
        main = "Hospital admission - D3", ylim = c(-0.12, 0.1),
        col = c("#f0b077","#ea801c","#8cc5e3","#3594cc"))
abline(h = 0, col = "red")
abline(v = 2.5, col = "gray", lty = 2)
text(x = 1.5, y = 0.09, labels = "Unweighted\n model")
text(x = 3.5, y = 0.09, labels = "Weighted\n model")
mtext('AUC', side=1, line=2, at=1, cex = 0.6)
mtext('AUC', side=1, line=2, at=2, cex = 0.6)
mtext('AUC', side=1, line=2, at=3, cex = 0.6)
mtext('AUC', side=1, line=2, at=4, cex = 0.6)

dev.off()



# Numerical results -------------------------------------------------------

filename <- "sim.des11.fa.real"

get(filename)[["auc"]][["pop.model.true"]]

mean(get(filename)[["auc"]][["unwm.unwauc"]])
mean(get(filename)[["auc"]][["unwm.wauc"]])
mean(get(filename)[["auc"]][["wm.unwauc"]])
mean(get(filename)[["auc"]][["wm.wauc"]])

sd(get(filename)[["auc"]][["unwm.unwauc"]])
sd(get(filename)[["auc"]][["unwm.wauc"]])
sd(get(filename)[["auc"]][["wm.unwauc"]])
sd(get(filename)[["auc"]][["wm.wauc"]])


