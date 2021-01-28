# Transmission of SARS-CoV-2 variants in Switzerland

Three recently detected [variants](https://covariants.org) (B.1.1.7, B.1.351, and P.1) of severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2) are currently being detected in various countries worldwide. Two of these variants have also been detected in Switzerland (B.1.1.7, B.1.351). 

Here, we aim at tracking the spread of these lineages in the Swiss canton of Geneva. To this end, we analyze samples that were sent to the [Geneva University Hospitals](https://www.hug.ch/en/) for primary diagnosis of SARS-CoV-2. All positives were re-screened for N501Y using RT-PCR. The majority of N501Y samples belong to B.1.1.7 and only a minority are B.1.351. To cover the period of November and December 2020, we use sequence data from randomly chosen samples from Geneva that were submitted to [GISAID](https://www.gisaid.org) by  the [Swiss Viollier Sequencing Consortium](https://bsse.ethz.ch/cevo/research/sars-cov-2/swiss-sequencing-consortium---viollier.html) from ETH Zurich. Hence, the full data data set provides a rather representative picture of the spread of N501Y in Geneva (download [here](data/variants_GE.csv)). Nevertheless, samples could be biased towards higher coverage of N501Y due to current outbreak investigations.

![](
figures/variants_GE.png)

The proportion of N501Y variants rapidly increases in Geneva. Due to the delay from infection to sample collection, the shown increase reflects the epidemiological situation from one to two weeks ago. Fitting a logistic growth model to the data allows to describe the increase in the proportion of N501Y (see [Volz et al.](https://www.medrxiv.org/content/10.1101/2020.12.30.20249034v2) for further details). We project that N501Y will reach a frequency of 82% (50% confidence interval, CI: 73%-89% (shaded area); 90% CI: 53%-95% (dashed lines)) by 1 March 2020.

Assuming that the effective reproduction number *R<sub>e</sub>* in Geneva was around 1 during December 2020 and January 2021 ([https://ibz-shiny.ethz.ch/covid-19-re-international/](https://ibz-shiny.ethz.ch/covid-19-re-international/)), we estimate a 33% (95% CI: 15%-56%) and 47% (95% CI: 21%-78%) increased transmissibility of N501Y variants compared to previously circulating variants, assuming a generation time of 5 and 7 days, respectively. These estimates are slighly lower than earlier findings for the UK ([Volz et al.](https://www.medrxiv.org/content/10.1101/2020.12.30.20249034v2), [Davies et al.](https://cmmid.github.io/topics/covid19/uk-novel-variant.html), [Leung et al.](https://www.eurosurveillance.org/content/10.2807/1560-7917.ES.2020.26.1.2002106)). The further spread of N501Y will also depend on the overall epidemic dynamics of SARS-CoV-2 in Geneva.

###Contributors:

- Martina Reichmuth, Emma Hodcroft, Julien Riou, Christian L. Althaus, [Institute of Social and Preventive Medicine](https://www.ispm.unibe.ch), University of Bern, Bern, Switzerland

- Isabella Eckerle, Laurent Kaiser, [Geneva University Hospitals](https://www.hug.ch/en/), Geneva, Switzerland

- Richard Neher, [Biozentrum](https://www.biozentrum.unibas.ch/research/researchgroups/overview/unit/neher/), University of Basel, Basel, Switzerland
