# SimStudy_AUCw_COVID
GitHub repository for R code and results related to the study: "Evaluating AUC Estimators Across Complex Sampling Designs: Insights from COVID-19 Patient Data" 

The repository contains the following information:
- `sim_exe.R`: R script used to run the simulation study.
- `res_exe.R`: R script used to generate boxplots and numerical summaries.
- The `functions` folder contains the implemented functions:
  - `f.sim.real.R`: the main simulation function.
  - `f.sample.R`: function used to sample the population.
- [The results can be downloaded here.](http://aiparragirre006.quickconnect.to/d/s/12nVgTMyAe3S2noA0UYgler7kQooSKr0/9bjZEhitrtuG9i8JVZZpvuTt7toazk_M-GbjA7bv4LAw) The folder contains all the outputs obtained from the simulation study.

**Note:** The results in this repository cannot be fully reproduced, as the population data used in the study is not publicly available due to its sensitive nature and privacy concerns. However, all estimated AUCs can be recalculated using the available data on outcomes, predicted probabilities, and sampling weights included in the results.
