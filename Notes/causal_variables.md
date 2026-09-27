## Basics

Exposure: the characteristic whose relationship with the outcome we're interesed in

* Primary causal variable

Outcome: the resultant event we're studying

## Confounding Variables

Could there be a varialbe related to someone's likelihood of having a pre-existing medical condition **AND independently** be related to their likelihood of hospitalization from COVID?

* Probably age because longer life is more chance for pre-existing medical condition to form, and ~~older people typically go to the hospital more than younger people~~. Is that scientifically sound? Older age is associated with increased risk of hospitalization

Potential Confounding: confounder is a varialbe that can distort the observed relationship between an exposure and an outcome because it's related to **both**
* Only confounding if it relates to both sides

* If we think there's a confounding variable, don't compare different distributions of that variable for exposure and outcome
    * **BAD**: Medical-condition group is mostly old | No-condition group is mostly young
    * **GOOD**: Medical-condition group and No-condition group are the same age distribution
        * Confounding control isn't necessarily making the distributions identical

* Confounders can't be discovered by looking at the dataset!
    * Confounder selection should pirmarily come form understanding of the data-generating/causal process and informed by prior scientific evidence (can't come from variables that happen to correlate in our dataset)

* From an ML background, I need to stop looking for what variables are in my dataset and start transitioning to what process generated the values in my dataset

Goal: compare exposure groups in a way that accounts for differences in the distribution of the confounder

```
CONFOUNDER

        C
       ↙ ↘
      E → Y

C is a common cause of E and Y

May create/distort the observed E–Y association

Often something we want to account for
```

Confounder: a variable that is a common cause, or represents an open noncausal pathway, between the exposure and outcome and can therefore distort the association between exposure and outcome

* Temporally precedes the expsorure and is not caused by the exposure

Unmeasured Confounding: a backdoor path that exists in a DAG that can't be measured by the dataset

## Mediator Variables

A $\to$ B $\to$ C could represetn a causal pathway from A $\to$ C, but the arrows in a causal directed acyclic graph (DAG) isn't the same as discrete math logic rules; it's a claim about a causal relationship

### Mediator Sample

medical condition $\to$ COVID severity $\to$ hospitalization

If that causal structure is correct, then medical conditions can affect hospitalization through disease severity

* If we adjust for COVID severity, we're asking to "Compare people with and without medical conditions while holding COVID severity constant"
    * No longer estimating the total relationship/effect of medical conditions on hospitalization because we've removed the portion operating through severity

Mediator: a variable that lies on a causal pathway between the exposure and outcome. Adjusting for a mediator can remove part of the relationship we're trying to estimate if our goal is the total effect

```
MEDIATOR

E → M → Y

M lies on the causal pathway from E to Y

Adjusting for M can block part of the effect we're trying to estimate if we want the total effect
```

Correlation doesn't determine whether severity is a mediator. Causal structure does!!!

* Even if relationships are noisy and there are thousands of outliers, severity can still mediate part of the effect

## Collider Variables

Collider Rule: conditioning on a collider can create an association between its causes even if those causes were originially independent
    * Conditioning: restricting, stratifying, selecting, or adjusting based on that variable

```
COLLIDER

E → C ← Y

C is a common consequence of E and Y

Conditioning on C can CREATE an association between E and Y that did not previously exist

Generally, don't condition on it merely because it is associated with both variables
```

Suppose medical conditions and hospitalization were otherwise completely unrelated but then we only analyzed people where $S=1$

Can restricting our dataset based on $S$ could somehow make medical conditions and hospitalization appear associated when they weren't originally?

* ~~Yes it could because we're looking at exposure and outcome. Two different exposure variables that result in the same outcome will show high correlation. Then again, correlation doesn't determine mediators, but I don't think we're looking at a mediator because it's not the structure A $\to$ B $\to$ C~~ Yes. Conditioning on $S$, a common consequence of the exposure and outcome, can induce a statistical association between its causes even if they were independent before conditioning

### Collider Sample

```
Academic ability → Admission ← Athletic ability
```

Assume academic and athletic ability are completely independent in the overall population

* Only look at admitted students
    * low academic ability may cause inference to be that they're really athletic and vice-versa

Among admitted students, knowing one variable suddenly tells you something about the other

* We created the association by selecting people based on their common consequence (admission status), resulting in collider bias

### Colliders in Epidemiology

People with underlying medical conditions may be more likely to interact with healthcare systems and therefore become the documented class

* Severe cases may also be more likely to be tested/reported and enter surveillance

```
Medical condition → Included in surveillance ← Severe disease
```

Not definitively proven for the data-generating process of the CDC dataset because we can't prove it

* Dataset contains **ONLY** people who made it into surveillance, so selection into the dataset could potentially induce a relationship that isn't present in the greater population

* Huge $N$ doesn't rescue a dataset from selection bias