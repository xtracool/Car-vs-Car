#server.R

diabetesRisk <- function(glucose) glucose / 200

highLow <- function(v1, v2) { if (v1 > v2) return(v1) else return(v2)}
LowHigh <- function(v1, v2) { if (v1 > v2) return(v2) else return(v1)}

##
whichIsBetter <- function(v1, v2, attr) { 
  result <- switch(attr, "mpg"=highLow() )
  
  return(result)
} 

##
getRows <- function(r1,r2) { 
  f <- c(r1,r2)
  fd <- filter(c, names %in% f )
  return(fd)
}



# get data and add names
data(mtcars)
d <- mtcars
d$names <- rownames(d)

library(dplyr)

# everything before this gets called only once
shinyServer(
  function(input, output) {
    #output$inputValue <- renderPrint({input$glucose})
    #output$prediction <- renderPrint({diabetesRisk(input$glucose)})
    
    output$car1 <- renderPrint({input$car1})
    output$car2 <- renderPrint({input$car2})
    
    # calc difference between 
    output$attr <- renderPrint({
      cd <- getRows(input$car1, input$car2)
      
      if ( input$attr == "mpg") {
        v <- abs( cd[1,1] - cd[2,1] )
        return(v)
      }
      else if ( input$attr == "cyl") {
        v <- abs( cd[1,2] - cd[2,2] )
        return(v)
      }
      
      else if ( input$attr == "disp") {
        v <- abs( cd[1,3] - cd[2,3] )
        return(v)
      }
      else if ( input$attr == "hp") {
        v <- abs( cd[1,4] - cd[2,4] )
        return(v)
      }
      else if ( input$attr == "drat") {
        v <- abs( cd[1,5] - cd[2,5] )
        return(v)
      }
      else if ( input$attr == "wt") {
        v <- abs( cd[1,6] - cd[2,6] )
        return(v)
      }
      else if ( input$attr == "qsec") {
        v <- abs( cd[1,7] - cd[2,7] )
        return(v)
      }
      else if ( input$attr == "vs") {
        v <- abs( cd[1,8] - cd[2,8] )
        return(v)
      }
      else if ( input$attr == "am") {
        v <- abs( cd[1,9] - cd[2,9] )
        return(v)
      }
      else if ( input$attr == "gear") {
        v <- abs( cd[1,10] - cd[2,10] )
        return(v)
      }
      else if ( input$attr == "carb") {
        v <- abs( cd[1,11] - cd[2,11] )
        return(v)
      }
      #else return("N/A")

    })    

    # show details values
    output$sugg <- renderPrint({
      getRows(input$car1, input$car2)
    })
    
    # show plot for selected cars
    output$plot <- renderPlot({
      d <- getRows(input$car1, input$car2)
      d2 <- select(d, -names)
      plot(d2)
    })
    
  }
)