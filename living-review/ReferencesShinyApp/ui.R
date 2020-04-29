#######################################################
#                   MJ Counotte                       #
#        A very simple-fast references list           #
# https://ispmbern.github.io/covid-19/living-review/  #
#                                                     #
#######################################################

content <- navbarPage("SARS-CoV-2 references", id="nav",

 tabPanel("References",
           
    hr(),
    downloadButton("downloadData", "Download as CSV"),
    downloadButton("downloadData2", "Download as RIS"),
    dataTableOutput('zikref'),
    HTML("loading the data can take a few seconds...")
  
  )
  
  ,tabPanel("About",
           
           fluidRow( h2("About the ncov LSR project") ),
           HTML("This Living Systematic Review retrieves and deduplicates scientific publications from different sources: PubMed, EMBASE, MedRxiv and BioRxiv. <br><small>Please keep in mind that some sources are pre-print servers and these publications did not undergo peer-review</small>"),
           br(),
           br(),
           HTML("Highlighting: <mark style=\"background-color:#ffcccb\">PREPRINT</mark> <mark style=\"background-color:#90ee90\">Peer reviewed</mark>"),
           br(),br(),
           HTML("<a href=\"https://ispmbern.github.io/covid-19/living-review/\">More info about the project and methods</a>")

  ))
