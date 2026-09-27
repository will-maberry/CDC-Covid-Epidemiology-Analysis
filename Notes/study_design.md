# Dataset Description

## Row Description

Each row represents a deidentified person who became a record in the CDC COVID-19 case surveillance
* Does not necessarily mean everyone is American because we don't know that
    * Matters for selection bias and what population final conclusions can generalize to

## Column Descriptions

### Time

cdc_case_earliest_dt: CDC's best avaialable illness-related date
* Constructed variable using available date and good for time-series modeling

cdc_reprt_dt: date the case was first reported
* Now deprecated so use cdc_case_earliest_dt

pos_spec_dt: first positive specimen date

onset_dt: symptom onset date when available

### Subject Characteristics

sex, age_group, and race_ethnicity_combined

### Disease Severity

All take values: Yes; No; Unknown; Missing

hosp_yn: hospitilization

icu_yn: was patient admitted to the ICU

death_yn: did the patient die as a result of the illness

### Health Status

medcond_yn: ~~was there presence of an underlying comorbidity or disease~~ an underlying comobidity or disease was reported
* comorbidity: simultaneous presence of two or more medical or psychological conditions in a person
    * Doesn't definitively tell us there were simultaneous conditions, just that it was reported

current_status: dealing with lab-confirmed or probable case

## Dataset Question

Among reported COVID-19 cases, was having a pre-existing mdeical condition associated with hospitilization

* Exposure: the characteristic whose relationship with the outcome we're interesed in
    * Hypothesis: ??? $\to$ Hospitilization, where exposure would be pre-existing medical condition

* Outcome: health event we're studying
    * Exposure $\to$ ???, where ~~the outcome is hospitilization~~ the exposure could be associated with hospitilization

## Study Question

Pre-existing medical condition $\to$ hospitilization

* Arrow means relatioship we're interested in, not that it establishes causation

Discovering people with a reported pre-existing medical condition being hospitalized more frequently than those without **DOES NOT MEAN** pre-existing medical condition explain the higher hospitilization rate

## Missingness

Exposure and outcomes can be: yes, no, unknown, or missing

* Potential analytic restriction

```
keep medcond_yn = Yes/No
keep hosp_yn = Yes/No
```

Complete-Case Analysis: condition on complete information to restrict analysis to cases with known exposure and outcome status

* Conditioning on this could introduce a collider if severe cases receive more documentation and people with pre-existing conditions have more detailed medical records

# Things to Internalize!

$DAG \neq TRUTH$
* The DAG is a model of assumptions about the data-generating process

No need to run a logistic regression model to find a small p-value and determine cofounders
* Propose causal relationships before analyzing data, got to prior epidemiological evidence, find studies with the correct exposure/outcome scenario, check their populations and adjustment, and used that as evidence to inform DAG

Literature review for causal inference can be tricky because you have to find papers that support your *specific* causal claim of interest