[[Home]](index.html)

# Conducting Living systematic reviews using the COVID-19 Open Access (COAP) data

**MJ Counotte, 2020**

Here, we describe how you can use the data we index and deduplicate daily  in our  COVID-19 Open Access Project (COAP) to conduct Living Systematic Reviews (LSRs). 

## Living systematic reviews

A LSR is defined as "Systematic review that is continually updated, incorporating relevant new evidence as it becomes available" [[Link]](https://www.jclinepi.com/article/S0895-4356(17)30636-4/fulltext). In 2017, the Journal of Clinical Epidemiology (JCE) published a series on how to conduct LSRs and the technical challenges and advances. Compared to a 'classic' systematic review, an LSR should have a predefined protocol on the updating frequency, the duration of maintenance, the peer review of updates, and several other elements. The first publication in the JCE series provides additional details [[Link]](https://www.jclinepi.com/article/S0895-4356(17)30636-4/fulltext).

## Workflow of systematic reviews

As described earlier, our suggested workflow is based on optimizing a 'classic' systematic review, so we can iteratively run the searches, deduplication, screening, data extraction, data aggregation, and generation of output (Figure 1).

![lsr workflow](https://f1000researchdata.s3.amazonaws.com/manuscripts/14886/9bcb9d8e-802c-4066-a6b4-5475e992e82b_figure1.gif)

**Figure 1.** The workflow of a systematic review from [Counotte, 2018](https://f1000research.com/articles/7-196/v1).

We start by [[Collecting data]](collectingdata.html) from different data sources. Currently, we collect citation data from BioRxiv, MedRxiv, MEDLINE (PubMed) and EMBASE. Once we have clean reference data from the different sources, we perform [[Deduplication]](deduplication.html). The data we provide, corresponds with the output of Module 1 in Figure 1. Starting with this dataset, avoids the tedious process of running multiple searches and deduplications for every update.

## Getting the data

[[Here]](https://github.com/ZikaProject/COVID_references) you find the most current version of the reference data. This is the same data that is available through a [[Shiny app]](https://zika.ispm.unibe.ch/assets/data/pub/search_beta/)). The data can be downloaded directly from [[GitHub]](https://github.com/ZikaProject/COVID_references). 

At the moment we provide a **CSV** format and a **RIS** format of the data. The CSV data is structured according to the description you find [[Here]](datastructure.html). The **RIS** format is compatible with most reference manager software.

## Filtering the data

The dataset contains SARS-CoV-2/COVID-19 research from the different bibliographic databases. However, for specific review questions, we only need a subset of this data. We can apply a search filter within the Title/Abstract using the [[Shiny app]](https://zika.ispm.unibe.ch/assets/data/pub/search_beta/), or we can perform the data manipulation in other software. 

## Chosing an appropriate database to keep the data

Keeping in mind that the screening and data aggregation can ideally be automated, or at least accessed by different systems, you want to opt for a database that allows communication with your analyses software. In the examples below we use [[R]](https://www.r-project.org/) and [[RShiny]](https://shiny.rstudio.com/). Ideally, the database allows access control,  keeps track of changes and has backup capacity. Reference managers or Microsoft Excel perform poorly in this setting and are not databases.

In our LSRs, we use REDCap (Research Electronic Data Capture) [[Link]](https://www.project-redcap.org/). Here, we can import the CSV data of the references and we can define our own extraction forms. This database also provides a well documented application programming interface (API) access to the data [[Example]](https://education.arcus.chop.edu/redcap-api/). REDCap works with 'instruments' or forms. [[Here]](data/ScreeningApi_Example.zip) we provide an example of an instrument used for screening/API access to a screening app, compatible with our [[Data format]](datastructure.html).

## Screening the data

To accelerate the screening and verification of publications, we built a simple Shiny app. This loads references and displays these to the reviewers. They execute their tasks in the shiny environment and decisions are logged into the central database. A demo of a simple screening app can be found [[Here]](https://zika.ispm.unibe.ch/assets/data/pub/screening_demo/) and the source code is available [[Here]](https://github.com/ZikaProject/ShinyScreeningExample).

## Extracting the data

Custom forms and reporting in REDCap allows us to filter the records that have been screened into the LSR and perform data extraction. The API environment allows us to export the data into our analyses software and run the analyses directly on the data. 

## Data output

Optimizing the data output allows the rapid production of tables, figures or even whole documents. By using scripts to access, process the data and run analyses, we can update tables and figures as new information is extracted. REDCap and its reporting and API functionality, combined with R scripts allows us to update these elements instantly.  [[R Markdown]](https://rmarkdown.rstudio.com/) provides functionality to extend the scripts to the production of documents (PDF, MS Word files, or HTML). From our data structure, we can easily output and access references, for example in RIS or BibTeX format [[Example code]](data/bibris_examples.R). Thus, using RMarkdown, we can automatically produce tables including references. 

