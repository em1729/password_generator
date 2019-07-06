## app.R ##

##Libraries---------------
library(shinydashboard)

##function---------------------
password_generator = function(len=10, n=1){
dummydt=data.frame(matrix(ncol=0,nrow=n))
comb = c(LETTERS, letters, 0:9)
p=c(rep(0.005,26), rep(0.035,26), rep(0.02,10))  
pw = replicate(nrow(dummydt),paste0(sample(comb, len, prob = p, replace = F), collapse = ""))
dummydt$password= pw
return(dummydt)
}


##CSS------------------------
css="

#password{
font-size:24px;
}
}"

##UI------------------------




ui <- dashboardPage(
  title = "Password Generator",
  dashboardHeader(title = "Password Generator",
                  titleWidth = 1325),
  dashboardSidebar(disable = T),
  dashboardBody(
 
    fluidRow( 
      tags$style(css),
      box( width = 4,
           background = "yellow",
           solidHeader = T,
          selectInput("len",label = h3("Length of password"),
                      selected=10, multiple = F, choices = c(8:14)),
          numericInput("num", label = h3("Number of passwords"), value=1))
      ,
      
    
      box( title = "",
        width = 8, status = "primary",
           solidHeader = T,
          tableOutput("password"))
      )
    )
  )



##Server----------------

server <- function(input, output, session) {
  
  
 df= reactive({password_generator(input$len, input$num)})

  output$password= renderTable(df(), striped = TRUE, 
                               hover = TRUE, bordered = TRUE,
                               rownames = TRUE
                               )
  

}




##run-------------
shinyApp(ui, server)