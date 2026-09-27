1. Inspect Varialbe Distributions
* Number of observations
* Categories actually present for medcond_yn and hosp_yn
* Frequencies and percentages of values

2. Quantify Exposure/Outcome Completeness
3. Ask Whether Completness is Patterned
4. Decide how to Handle Unknown/Missing

# Restrict 100M+ rows to pre-vaccine pandemic

* Study Question: Among reported COVID-19 cases during the early pre-vaccine period, was havng a reported pre-existing medical condition associated with hospitalization?

* All reported COVID cases $\to$ Early pre-vaccine reported cases
    * $StartDate \leq cdc\_case\_earliest\_dt \leq EndDate$

* Studying a more epidemiologically coherent period at the cost of generalizability

## Temporal Restriction

Study Period: March 15, 2020 - December 10, 2020

Restrict the study to the early US COVID-19 pandemic before COVID-19 vaccination became avalable under FDA Emergency Use Authorizaiton

Results will characterize the association between reported pre-existing medical conditions and hospitalization among reported COVID-19 cases during the stated period (not generalizable)

* Still 16M+ rows total

## Sampling

* Temporally restricted population dataset still too large
* Randomly sample 100k samples from the temporally restricted dataset