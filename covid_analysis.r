# Load COVID-19 surveillance sample
covid <- read.csv(
    "covid_early_pandemic_sample_10k.csv",
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
    # %in% c("Yes", "No") concatentates values into a vecotr and creates a boolean mask
        # Only get rows with the values in the vector
        # '&' lets you chain conditionals

# Keep a row only if mdecond_yn is Yes/No AND hosp_yn is Yes/No
    # From the covid dataset, select rows where the mask is TRUE and select all columns
    # Store resulting dataframe as analysis
analysis <- covid[
    covid$medcond_yn %in% c("Yes", "No") &
    covid$hosp_yn %in% c("Yes", "No"),
]

# Check analytic cohort size
dim(analysis)

# Create exposure-outcome 2x2 table
    # table( EXPOSURE, OUTCOME)
table(
    analysis$medcond_yn,
    analysis$hosp_yn
)