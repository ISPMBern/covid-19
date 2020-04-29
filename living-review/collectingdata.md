index: [[**HOME**](index.html)] [**Collecting data**] [[**Deduplication**](deduplication.html)] [[**Screening**](screening.html)]

# Getting data from different sources

We retrieve data from [EMBASE](http://www.embase.com) via OVID, [MEDLINE](https://www.ncbi.nlm.nih.gov/pubmed/) via PubMed, BioRxiv and MedRxiv.

## Search terms

When searches are updated, references that are identified that were not in the database before, are inserted by date (**date_entrez**) they were indexed in remote database, the date they are inserted in OUR database is formatted as the '**strategydate**' (raw data is available [here](https://github.com/ZikaProject/COVID_references)).

### 29.04.2020

MEDLINE:

``("coronavirus"[MH] OR "coronavirus infections"[MH] OR "coronavirus"[TW] OR "corona virus"[TW] OR "HCoV"[TW] OR "nCov"[TW] OR "covid"[TW] OR "covid19"[TW] OR "Severe Acute Respiratory Syndrome Coronavirus 2"[TW] OR "SARS-CoV2"[TW] OR "SARS-CoV 2"[TW] OR "SARS Coronavirus 2"[TW] OR "MERS-CoV"[TW]) AND (2019/1/1:3000[PDAT])``

### 01.04.2020

From 01.04.2020, we retrieve the currate BioRxiv/MedRxiv dataset [Link](https://connect.medrxiv.org/relate/content/181)

### 26.03.2020

MEDLINE:

``("Wuhan coronavirus" [Supplementary Concept] OR "COVID-19" OR SARS-CoV-2 OR "2019 ncov"[tiab] OR (("novel coronavirus"[tiab] OR "new coronavirus"[tiab]) AND (wuhan[tiab] OR 2019[tiab])) OR 2019-nCoV[All Fields] OR (wuhan[tiab] AND coronavirus[tiab]))``

EMBASE:

``(nCoV or 2019-nCoV or ((new or novel or wuhan) adj3 coronavirus) or covid19 or covid-19 or SARS-CoV-2).mp. ``

BioRxiv/MedRxiv:

``ncov or corona or wuhan or COVID or SARS-CoV-2``

With the kind support of the [Public Health & Primary Care Library PHC](https://www.unibe.ch/university/services/university_library/faculty_libraries/medicine/public_health_amp_primary_care_library_phc/index_eng.html), and following guidance of the [Medical Library Association](https://www.mlanet.org/p/cm/ld/fid=1713)

### 01.01.2020

MEDLINE:

``("Wuhan coronavirus" [Supplementary Concept] OR "COVID-19" OR "2019 ncov"[tiab] OR (("novel coronavirus"[tiab] OR "new coronavirus"[tiab]) AND (wuhan[tiab] OR 2019[tiab])) OR 2019-nCoV[All Fields] OR (wuhan[tiab] AND coronavirus[tiab])))))``

EMBASE:

`` ncov OR (wuhan AND corona) OR COVID``

BioRxiv/MedRxiv:

``ncov or corona or wuhan or COVID``


## Defining the data format
[Here](datastructure.html) we describe how the data is formatted. 

### Dates
We sort the information based on when the data was entered into the external database (MEDLINE, EMBASE, Rxiv), since publication date information is not always complete nor reliable.  

## PubMed 
PubMed is accessible through the package [RISMed](https://cran.r-project.org/web/packages/RISmed/RISmed.pdf). We still need to process the data to a prespecified format.

```R
library("RISmed")

PMquery="(\"Wuhan coronavirus\" [Supplementary Concept] OR \"2019 ncov\"[tiab] OR ((\"novel coronavirus\"[tiab] OR \"new coronavirus\"[tiab]) AND (wuhan[tiab] OR 2019[tiab])) OR 2019-nCoV[All Fields] OR (wuhan[tiab] AND coronavirus[tiab])))))"

Searchpubmed<-function(query){

  search_query <- EUtilsSummary(query, retmax=1000) # we can restrict time with: , mindate=2012, maxdate=2019)
  records<- EUtilsGet(search_query)
  
  #concatenate authors:
  authors<-vector()
  author1<-vector()
  for(n in 1:length(records@Author)){
    tmp<-paste0(records@Author[[n]]$LastName,", ",records@Author[[n]]$Initials)
    tmp2<-paste(tmp, collapse="; ")
    authors<-append(authors,tmp2)
    author1<-append(author1,records@Author[[n]]$LastName[1])
  }
  
  # we need to add additional fields
  pubmed_data <- data.frame('authors'=authors, 'title'=ArticleTitle(records),
                            'abstract'=AbstractText(records),'journal'=MedlineTA(records), 'pages'=MedlinePgn(records),
                            'volume'=Volume(records),'issue'=Issue(records),'year'=YearPubmed(records),
                            'pmid'=PMID(records), 'doi'=ELocationID(records), 
                            'url1'=paste0("https://www.ncbi.nlm.nih.gov/pubmed/",PMID(records)), 'author1'=author1) 
  
 return(pubmed_data) 
}  
```

## medRxiv and bioRxiv
Here, we opted for a very simple solution. We grab all DOIs of the last 75 record, and requery these to get the complete citation data:

```R
prep.doi.biorxiv<-function(population){
  pops<-html_text(population)
  doi<-pops[seq(3,length(pops),by=4)]
  doi<-paste0("10.1101/",doi)
  doi <- str_remove(doi, "; ")
}
```

```R
biorxivmed <- function(url){
  dois <- url %>%
    xml2::read_html() %>%
    html_nodes('.highwire-cite-metadata')
  doi <- prep.doi.biorxiv(dois)
  list.all.doi <- c()
  for (i in 1:length(doi)){
    cat("nr:",i,"doi:",doi[i],"status:")
    doi.get <- get_doi(doi[i])
    cat("retrieved \n")
    list.all.doi <- append(list.all.doi, doi.get)
  }
  return(list.all.doi)
}
```

```R
get_doi<-function(doi) { #https://rdrr.io/github/wkmor1/doi2bib/src/R/doi2bib.r
  content(
    GET(
      url    = paste0("http://dx.doi.org/", doi),
      config = accept("application/rdf+xml;q=0.5, application/vnd.citationstyles.csl+json;q=1.0")
    ),
    as = "text",
    encoding = "UTF-8"
  )
}
```

We want to return a dataframe that is uniform for all different sources:

```R
doijson <- function(jsondoi){ # returns dataframe from json 
  authors <- vector()
  author1 <- vector()
  for(n in 1:nrow(jsondoi$author)){
    tmp1 <- paste0(jsondoi$author$family[n],", ", gsub("[^A-Z]*([A-Z])[^A-Z]*", "\\1", jsondoi$author$given[n]))
    authors <- append(authors,tmp1)
    authors <- paste(authors, collapse="; ")
    author1 <- jsondoi$author$family[1]
  }
  
  # we need to add additional fields
  
  # some checks for empty fields:
  abstract=ifelse(is.null(jsondoi$abstract),NA,jsondoi$abstract) # check for empty
  journal=ifelse(is.list(jsondoi$`container-title`) & length(jsondoi$`container-title`) == 0,NA,jsondoi$`container-title`) # check for empty
  
  doi_data <- data.frame('authors'=authors, 'title'= jsondoi$title, 'author1'=author1, 'abstract'= str_remove(abstract, "<jats:p>"),
                         'doi'=jsondoi$DOI, 'url1'= jsondoi$URL, 'journal'= journal, "year" = jsondoi$posted$`date-parts`[1], 
                         "month" = jsondoi$posted$`date-parts`[2], "date_entrez" = jsondoi$posted$`date-parts`[3],
                         "institution" = jsondoi$institution$name, "publisher" = jsondoi$publisher)  # add other fields.
  return(doi_data)
}
```
