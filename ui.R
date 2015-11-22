# ui.R

library(shiny)

# run this from command line: runApp(display.mode="showcase")

shinyUI(
  
  navbarPage("Car vs Car Comparison Tool",
    tabPanel("Compare",
         
      sidebarPanel(
          selectInput("car1","Choose Car 1", rownames(mtcars), selected="Valiant"),
          selectInput("car2","Choose Car 2", rownames(mtcars)),
          selectInput("attr", "Attribute", colnames(mtcars)),
          submitButton('Submit')
      ),
      mainPanel(
        h3('Comparison'),
        h4('Car 1'),
        verbatimTextOutput("car1"),
        h4('Car 2'),
        verbatimTextOutput("car2"),
        h4('Attribute comparison'),
        verbatimTextOutput("attr"),
        h4("General Comparsion"),
        verbatimTextOutput("sugg"),
        plotOutput("plot")
      )
    ),
    
    tabPanel("About",
      mainPanel(
        h4('A graphical tool for comparing two cars from the Motor Trends Cars Data set.'),
        h4('Written by Ven Reddy')
      )
    )
  )
)
