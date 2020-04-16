# Flexible generation of output

# R Markdown output generation

[R markdown](https://rmarkdown.rstudio.com/index.html) provides the 


https://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html


# References

```
library(stringr)

writeRIS<-function(df){
  sink("outfile.RIS", append = FALSE)
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
```