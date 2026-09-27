# Research Question

Among reported COVID-19 cases during the early pre-vaccine period, was having a reported pre-existing medical condition associated with hospitalization?

# Table

Once we restrict to know $E$ nad $Y$, we'll have this $2 \times 2$ table:

| | Hospitalized | Not hospitalized | Total |
|---|---:|---:|---:|
| **Medical condition** | \(a\) | \(b\) | \(a+b\) |
| **No medical condition** | \(c\) | \(d\) | \(c+d\) |

# Calculations

Calculate hospitilization risk in each exposure group

$R_1 = P(Y=1 | E=1)=\frac{a}{a+b}$

* $a + b$ is everyone exposed

* Among those with $E=1$,what proportion had $Y=1$

$R_0 = P(Y=1 | E=0)=\frac{c}{c+d}$

* $c + d$ is everyone unexposed

* Among those with $E=0$,what proportion had $Y=1$

## Risk Ratio

$RR=\frac{R_1}{R_0}$

### Sample

Hospitalization were 20% among people with a reported medical condition and 10% among those without, so $RR=\frac{0.20}{0.10}=2.0$

* Interpretation: Cases with a reported pre-existing medical condition had **2 times the risk of hospitalization** compared with cases without a reported pre-existing medical condition
    * Tells us the relative association

### Null Value

$RR=1$ means $R_1=R_0$

## Risk Difference

$RD=R_1 - R_0$

### Sample

$RD=0.20-0.10=0.10$ (10 percentage points)

* Interpretation: Hospitalization risk was **10 percentage points higher** among caes with a reported pre-existing medical condition
    * Tells us the absolute difference

### Null Value

$RD=0$ means $R_1-R_0=0$

## Important Note

$RR$ and $RD$ complement one-another well. An $RR$ of 2 sounds enormous but $1\% \to 2\%$ and $20\% \to 40\%$ both have $RR=2$, while their absolute implications are very different

## Odds Ratio

If risk is 20\%:
$Risk=\frac{20}{100}=0.20$

Odds are: $Odds=\frac{20}{80}=0.25$

OR compares those odds

$OR=\frac{a/b}{c/d}=\frac{ad}{bc}$

With 20% versus 10%:

$OR=\frac{0.20/0.80}{0.10/0.90}=2.25$

$RR=2.00$ but $OR=2.25$ because they're not the same thing

* When outcome is rare, $OR$ and $RR$ become numerically similar but very different as outcome becomes more common

# Effect Measures

The primary effect measure will be the risk ratio (RR), comparing the probability of reported hospitalization among cases with verusus without a reported pre-existing medical condition

The risk difference (RD) will be reported as a secondary absolute measure

Both will have 95% confidence intervals

Odds ratios (ORs) may be estimated in regression analyses but will be interpretaed as odds ratios rather than approximations of risk ratios unless the outcome is sufficiently rare for the OR to closely approximate the RR

# Confidence Intervals

CI expresses the sampling uncertainty around our estimate under the assumptions of the procedure

* Interpretation: If we repeatedly sampled using the same process and constructed intervals using the sme procedure, approximately 95% of those intervals would contain the target parameter

* Point Estimate: best estimate from the observed sample

* Wider CI = less precision; narrower CI = greater precision

* Whether a CI includes the null helps assess compatibility with no association, but the effect magnitude and precision should be interpreted

## Logs

$RR \in (0, \infty)$ and null value is 1 with a generally asymmetric sampling distribution. Instead of constructing CI directly around $RR$, work with $\ln(RR)$

* Log transforms $(0,\infty) \to (-\infty, \infty)$

$SE[\ln(RR)]=\sqrt{\frac{1}{a}-\frac{1}{a+b}+\frac{1}{c}-\frac{1}{c+d}}$

* Estimates how much sampling variability we expect in our log risk ratio

## Standard Error

for two independent proportions, standard error of the risk difference is:

$SE(RD)=\sqrt{\frac{R_1(1-R_1)}{n_1}+\frac{R_0(1-R_0)}{n_0}}$