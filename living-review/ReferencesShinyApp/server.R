#######################################################
#                   MJ Counotte                       #
#        A very simple-fast references list           #
# https://ispmbern.github.io/covid-19/living-review/  #
#                                                     #
#######################################################

rm(list=ls())

library(shiny)
library(leaflet)
library(stringr)



# compile RIS function:
getRIS <- function(df){
  df$authors<-as.character(df$authors)  
  tmp<-""
  for(i in 1:200){
    tmp<-paste(tmp,"TY  -\n", sep="")
    tmp<-paste(tmp,"TI  -", df$title[i], "\n", sep="") 
    auth<-unlist(strsplit(df$authors[i],";"))
    for(a in 1:length(auth)){      
      tmp <- paste(tmp,"AU  -", auth[a], "\n", sep="")
    }
    tmp<-paste(tmp,"AB  -", df$abstract[i], "\n", sep="")
    tmp<-paste(tmp,"T2  -", df$journal[i], "\n", sep="")
    tmp<-paste(tmp,"VL  -", df$volume[i], "\n", sep="")
    tmp<-paste(tmp,"IS  -", df$issue[i], "\n", sep="")
    tmp<-paste(tmp,"PY  -", df$year[i],"\n", sep="")
    tmp<- paste(tmp,"UR  -", df$url1[i],"\n", sep="")
    tmp<-paste(tmp,"SP  -", df$pages[i], "\n", sep="")
    tmp<-paste(tmp,"DO  -",df$doi[i],"\n", sep="") 
    tmp<-paste(tmp,"ER  -\n\n", sep="")
  }
  
  return(tmp)
}

server <- function(input, output, session) {
  

  data <- eventReactive(input$reload, {
    
    df <- read.csv(file="https://raw.githubusercontent.com/ZikaProject/COVID_references/master/current.csv", stringsAsFactors=FALSE)
    df$source<-as.numeric(df$source)
    df$preprint=ifelse(df$source<3,TRUE,FALSE)
    df$journal=ifelse(df$source==2,"bioRxiv",df$journal)
    df$journal=ifelse(df$source==1,"medRxiv",df$journal)
    df$strategydate=as.Date(df$strategydate, format="%Y-%m-%d")
    df$date_entrez=as.Date(df$date_entrez, format="%d-%m-%Y")
    df=subset(df, !is.na(source))
    df=subset(df, !is.na(date_entrez))
    df=df[rev(order(df$date_entrez)),]
    
    # output datatable:
    
    df$link <- sprintf('<a href="%s" target="_blank" class="btn btn-primary">LINK</a>',df$url1)
    df$title2=ifelse(df$preprint, sprintf("<mark style=\"background-color:#ffcccb\">%s</mark>",df$title), sprintf("<mark style=\"background-color:#90ee90\">%s</mark>",df$title))
    df$title2=paste(df$title2,"<b>",df$journal,"</b>")
    return(df)
    
  }, ignoreNULL = FALSE)
  

  
  output$zikref <- renderDataTable(data()[,c(1,13,2,26,25)], escape = FALSE,        options = list(
    pageLength = 100))


  output$downloadData <- downloadHandler(
    filename = function() {
      paste("references.csv")
    },
    content = function(file) {
      write.csv(data()[,-c(25,26)], file, row.names = FALSE)
    }
  )

  output$downloadData2 <- downloadHandler(
    
    filename = function() {
      paste("references.ris")
    },
    content = function(file) {
      write(noquote(getRIS(data()[,-c(25,26)])), file)
    }
  )
}