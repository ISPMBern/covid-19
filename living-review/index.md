index: [**HOME**] [[**Collecting data**](collectingdata.html)] [[**Deduplication**](deduplication.html)] [[**Screening**](screening.html)]

<img align="left" width="165" height="57" src="https://zika.ispm.unibe.ch/COVID19/Logo_COAP.jpg" alt="COAP">
# Living Evidence on COVID-19


**Contributors:** [Michel Counotte](https://www.ispm.unibe.ch/about_us/staff/counotte_michel/index_eng.html), [Hira Imeri](https://www.ispm.unibe.ch/about_us/staff/imeri_hira/index_eng.html), [Aziz Mert Ipekci](https://www.ispm.unibe.ch/about_us/staff/ipekci_mert/index_eng.html), [Nicola Low](https://www.ispm.unibe.ch/about_us/staff/low_nicola/index_eng.html)

## [Go directly to the evidence database](https://zika.ispm.unibe.ch/assets/data/pub/search_beta/)



## Living evidence collection


Evidence informs guidance and public health decisions. In disease outbreaks, evidence is often scarce but accumulates rapidly. We need solutions to keep track of the emerging evidence. One of these solutions was suggested by [Elliot et al.](https://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.1001603): the living systematic review. A review that is updated as soon as new information becomes available.  

On this website, we explain how we set up a *Living Systematic Review* that can:
* Collect evidence from different sources
* Deduplicate information according to different criteria
* Move information to a central database
* Allow crowd-distributed screening
* Create flexible output in RShiny ([like this](https://zika.ispm.unibe.ch/assets/data/pub/ncov/))
* Create annotated reference lists to be used for other systematic reviews
* Searchable version in RShiny ([like this](https://zika.ispm.unibe.ch/assets/data/pub/search_beta/))

## Living systematic reviews & living evidence

In our 2018 paper ([Counotte et al.](https://f1000research.com/articles/7-196/v1)), we describe the workflow of conducting a living systematic review. 

![lsr workflow](https://f1000researchdata.s3.amazonaws.com/manuscripts/14886/9bcb9d8e-802c-4066-a6b4-5475e992e82b_figure1.gif)

We start by [**collecting data**](collectingdata.html) from different data sources. [Here](collectingdata.html), we describe how to get references from medRxiv, bioRxiv and PubMed. We also include information from EMBASE via [Ovid](https://ovidsp.ovid.com/), but are we are currently not at liberty to share our methods. 

Once we have clean reference data from the different sources, we perform [**deduplication**](deduplication.html). These deduplicated data are imported into a central database, where [**screening**](screening.html) takes place. 

## Current version of the data
[Here](https://github.com/ZikaProject/COVID_references) you find the most current version of the reference data. This is the same data that is available through ([the shiny app](https://zika.ispm.unibe.ch/assets/data/pub/ncov/)).
An preliminary version of annotated 'pre-screened' data is available on the [github](https://github.com/ZikaProject/COVID_references).

## Contact information
For additional questions email: **michel.counotte[at]ispm.unibe.ch**

## Funding
Funding acquisition: [Prof. Nicola Low](https://www.ispm.unibe.ch/about_us/staff/low_nicola/index_eng.html)

Funded by the [SNF](http://p3.snf.ch/project-176233)

## Citation

If you use our dataset, please cite it:

[Download RIS citation](citation_livingevidence.RIS)

```
@misc{
   author = {Counotte, M. J. and Imeri, H. and Ipekci, M. and Low, N.},
   title = {Living Evidence on COVID-19},
   url = {https://ispmbern.github.io/covid-19/living-review/},
   year = {2020},
   type = {Web Page}
}
```