#########
# Dataset
#########

# Load COVID-19 surveillance sample
covid <- read.csv(
    "Data/covid_early_pandemic_sample_10k.csv",
    stringsAsFactors = FALSE
)

# Check dataset dimensions
dim(covid)

# Check column names
names(covid)

# Preview dataset
    # Shows top 6 rows of table
head(covid)

# Create complete-case analytic cohort
    # new_dataframe <- old_dataframe[ROWS, COLUMNS]
    # Nothing after ',' is saying give me rows that match a condition and give me every column
    # covid$medcond_yn: get this column from this dataframe
    # c("Yes", "No") combines values into a vector
    # %in% checks whether each row's value belongs to that vector
        # Produces a TRUE/FALSE mask
        # Only get rows with the values in the vector
    # '&' lets you chain conditionals

# Keep a row only if medcond_yn is Yes/No AND hosp_yn is Yes/No
    # From the covid dataset, select rows where the mask is TRUE and select all columns
    # Store resulting dataframe as analysis
analysis <- covid[
    covid$medcond_yn %in% c("Yes", "No") &
    covid$hosp_yn %in% c("Yes", "No"),
]

# Check analytic cohort size
dim(analysis)

#########
# RR and RD
#########

# Create exposure-outcome 2x2 table
    # table( EXPOSURE, OUTCOME)
table(
    analysis$medcond_yn,
    analysis$hosp_yn
)

risk_exposed <- 250 / (250 + 459)
risk_exposed

risk_unexposed <- 27 / (27 + 728)
risk_unexposed

risk_ratio <- risk_exposed / risk_unexposed
risk_ratio

risk_difference <- risk_exposed - risk_unexposed
risk_difference

#########
# RR 95% CI
#########

# Assign 2x2 table cells
a <- 250
b <- 459
c <- 27
d <- 728

# Calculate standard error of log risk ratio
se_log_rr <- sqrt(
    (1 / a) - (1 / (a + b)) +
    (1 / c) - (1 / (c + d))
)

se_log_rr

# Log risk ratio
log_rr <- log(risk_ratio)

# Calculate 95% CI on log scale
    # 1.96 is Z critical value in normal distribution
    # Leaves 0.025 on either end of distribution
log_rr_lower <- log_rr - (1.96 * se_log_rr)
log_rr_upper <- log_rr + (1.96 * se_log_rr)

log_rr
log_rr_lower
log_rr_upper

# Transform 95% CI back to risk-ratio scale by exponentiating log
rr_lower <- exp(log_rr_lower)
rr_upper <- exp(log_rr_upper)

rr_lower
risk_ratio
rr_upper

#########
# RD 95% CI
#########

# Number of exposed and unexposed cases
n_exposed <- 250 + 459
n_unexposed <- 27 + 728

# Standard error of risk difference
se_rd <- sqrt(
    (risk_exposed * (1 - risk_exposed) / n_exposed) +
    (risk_unexposed) * (1 - risk_unexposed) / n_unexposed
)

se_rd

# Calculate 95% CI for RD
rd_lower <- risk_difference - (1.96 * se_rd)
rd_upper <- risk_difference + (1.96 * se_rd)

rd_lower
risk_difference
rd_upper

#########
# Descriptive Analysis
#########

# Exposure group sizes
table(analysis$medcond_yn)

# Age distribution by exposure
age_exposure <- table(
    analysis$age_group,
    analysis$medcond_yn
)

age_exposure

# Each column adds to 100%
    # margin = 2 because we're taking each column as denominator
    # Take each cell and divide by column total
round(
    prop.table(age_exposure, margin = 2) * 100,
    1
)

# Sex distribution by exposure
sex_exposure <- table(
    analysis$sex,
    analysis$medcond_yn
)

sex_exposure

# Each column adds to 100%
round(
    prop.table(sex_exposure, margin = 2) * 100,
    1
)

# Age distribution by outcome
age_outcome <- table(
    analysis$age_group,
    analysis$hosp_yn
)

age_outcome

# Each row adds to 100%
    # margin = 1 because we're taking each row as denominator
    # Take each cell and divide by row total
round(
    prop.table(age_outcome, margin = 1) * 100,
    1
)

# Sex distribution by outcome
sex_outcome <- table(
    analysis$sex,
    analysis$hosp_yn
)

sex_outcome

# Each row adds to 100%
round(
    prop.table(sex_outcome, margin = 1) * 100,
    1
)