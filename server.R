library(ggplot2)
library(car)
attach(mtcars)
mtcars$cyl<-as.factor(mtcars$cyl)
mtcars$gear<-as.factor(mtcars$gear)   # no. of forward gears
mtcars$carb<-as.factor(mtcars$carb)   # Number of carburetors
mtcars$am<-as.factor(mtcars$am)       # Transmission (0 = automatic, 1 = manual)
mtcars$vs<-as.factor(mtcars$vs)       # 

shinyServer(function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    
    d1<-mtcars[,c(input$xcol,input$ycol)]
    
    if(input$radio==1)
      d2<-mtcars[,10]
    if(input$radio==2)
      d2<-mtcars[,2]
    if(input$radio==3)
      d2<-mtcars[,9]
    if(input$radio==4)
      d2<-mtcars[,11]
    
    data<-cbind(d1,d2)
    data
  })
  
#   output$table <-renderTable({
#     selectedData()
#   })
  output$plot1 <- renderPlot({
    d<-selectedData()
    
    n<-rownames(d)
    y<-d[,2]
    x<-d[,1]
    f<-as.factor(d[,3])
#    par(mar = c(5.1, 4.1, 0, 1))
#     plot(d[,1],d[,2],
#          col = d[,3],
#          pch = 20, cex = 3,xlab=input$xcol,ylab=input$ycol)
    scatterplot(x,y,main="mtcars",
                xlab=input$xcol,ylab=input$ycol,
                legend.plot=TRUE,
                smoother=FALSE,
                groups=f,
                legend.coords="bottomright",
                legend.title="Color by",
                boxplots="xy")
  })
   
  output$cor<-renderText({
    d<-selectedData()
    co<-cor(d[,1],d[,2])
    as.character(co)
  })

})
