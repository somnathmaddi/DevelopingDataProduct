library(shiny)
attach(mtcars)
mtcars$cyl<-as.factor(mtcars$cyl)
mtcars$gear<-as.factor(mtcars$gear)   # no. of forward gears
mtcars$carb<-as.factor(mtcars$carb)   # Number of carburetors
mtcars$am<-as.factor(mtcars$am)       # Transmission (0 = automatic, 1 = manual)
mtcars$vs<-as.factor(mtcars$vs)       # 

shinyUI(pageWithSidebar(
  headerPanel('mtcars'),
  sidebarPanel(
    selectInput('xcol',h5('X Variable'), names(mtcars)[lapply(mtcars,class)=="numeric"]),
    selectInput('ycol',h5('Y Variable'), names(mtcars)[lapply(mtcars,class)=="numeric"],
                selected=names(mtcars)[lapply(mtcars,class)=="numeric"][[2]]),
    radioButtons("radio", label = h5("Interaction Effect of"),
                 choices = list("Gear" = 1, "Cylinder" = 2, "Transmission" = 3,"Carburetors" = 4), 
                 selected = 1)
  ),
  mainPanel(
  h3("Numeric Variables Observational Study"),
   plotOutput('plot1'),
   #tableOutput("table")
  h5("Correlation : "),
   verbatimTextOutput("cor")
  )
))