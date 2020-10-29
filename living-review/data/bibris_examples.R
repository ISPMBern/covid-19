# write a RIS file:
library(stringr)

df <- read.csv(file="https://raw.githubusercontent.com/ZikaProject/COVID_references/master/current_part1.csv", stringsAsFactors=FALSE)
df$journal=ifelse(df$source==1,"bioRxiv",df$journal)
df$journal=ifelse(df$source==2,"medRxiv",df$journal)

# sample 20 references:
df<- df[sample(nrow(df), 20), ]

writeRIS<-function(df){
  sink("bibliography.ris", append = FALSE)
  for(i in 1:nrow(df)){
    cat("TY  - JOUR\n")
    cat("RI  - REDCAP", str_pad(df$id[i], 4, pad = "0") ,"\n", sep="")
    cat("TI  - ", df$title[i], "\n")
    auth<-unlist(strsplit(df$authors[i],";"))
    for(a in 1:length(auth)){
      cat("AU  - ", auth[a], "\n")
    }
    cat("AB  - ", df$abstract[i], "\n")
    cat("T2  - ", df$journal[i], "\n")
    cat("VL  - ", df$volume[i], "\n")
    cat("IS  - ", df$issue[i], "\n")
    cat("PY  - ", df$year[i],"\n")
    cat("SP  - ", df$pages[i], "\n")
    cat("AN  - ",df$pmid[i],"\n")
    cat("DO  - ",df$doi[i],"\n") 
    cat("LB  - ",df$doi[i],"\n")
    cat("ER  -\n\n")
  }
  sink()
}


#install.packages("bib2df")
library(bib2df)
library(dplyr) #use dplyr to format our dataformat into bib2df format:

bib2 = df %>% mutate(CATEGORY="ARTICLE", 
                     BIBTEXKEY=paste0("REF_",str_pad(df$id, 4, pad = "0")),
                     ADDRESS=NA,
                     ANNOTATE=NA,
                     AUTHOR=strsplit(df$authors,";"),
                     BOOKTITLE=NA,
                     CHAPTER=NA,
                     CROSSREF=NA,
                     EDITION=NA,
                     EDITOR=NA,
                     HOWPUBLISHED=NA,
                     INSTITUTION=NA,
                     JOURNAL=df$journal,
                     KEY=NA,
                     MONTH=NA,
                     NOTE=NA,
                     NUMBER=df$issue,
                     ORGANIZATION=NA,
                     PAGES=df$pages,
                     PUBLISHER=NA,
                     SCHOOL=NA,
                     SERIES=NA,
                     TITLE=df$title,
                     TYPE=NA,
                     VOLUME=df$volume,
                     YEAR=df$year) %>% select(24:49)


df2bib(bib2, file="references.bib")
