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

# Primary Data Findings

* Sampled COVID-19 caess with $medcond\_yn \in \{Yes, No\}$ and $hosp\_yn \in \{Yes, No\}$ where $(n=1464)$
* Exposure: reported pre-existing medical condition | Yes or No
* Outcome: reported hospitalization | Yes or No
* Primary Confounders: age group and sex, based on DAG and lit review
* Calendar Time: needs consideration because there's strong temporal completeness in variation
* Race/Ethnicity: probably shouldn't enter edjustment set and should follow DAG
* Missing Data: primary complete-case analysis only has 14.64% of sampled cases have jointly ovserved $E$ and $Y$

What effect measure are we trying to estimate (Risk Ratio, Risk Difference, or Odds Ratio)?

# Interpretation of Results

Among cases in the complete-case analytic cohort under the study's temporal restriction, the observed risk of hospitalization among those with a reported pre-existing medical condition was 9.86 times the observed risk among those without a reported pre-existing medical condition

$RR_{crude}=9.86 (95\% CI: 6.72, 14.47)$

* This is a huge value, and DAG said age was a confounder. Some portion of this crude association could reflect differences in the age distributionsof the exposed and unexposed groups

* Frequentist Interpretation: ~~tell us the 95% bounds for the observed risk of hospitalization among those with a reported pre-existing medical condition.~~ if we repeatedly sampled under the same process and constructed confidence intervals using this procedure, approximately 95% of those intervals would contain the true risk ratio

* The 95% CI excludes the null value of 1, ~~indicates that the features probably aren't independent~~ providing evidence that hospitalization risk differs between exposure groups in this complete-case analytic sample

The observed hospitalization risk was 31.7 percentage points higher among cases with a reported pre-existing medical condition than among cases without one

$RD_{crude}=31.68$ percentage points $(95\% CI: 27.93, 35.44)$

Among cases in the complee-case anlytic cohort under the study's temporal restriction, the observed hospitalization risk was 31.7 percentage points higher among those with a reported pre-existing medical condition than among those without one

## IMPORTANT CAVEAT

These are crude, unadjusted estimates in the complete-case analytic cohort. They're not yet adjusted estimates and absolutely not causal effects

These are conventional Wald confidence itnervals and treate observations as independent. They don't account for the date-block sampling design or potential within-date dependence