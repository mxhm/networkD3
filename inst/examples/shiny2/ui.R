library(shiny)
library(networkD3)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Hello Shiny!"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    textOutput("node"),
    textOutput("edge")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    forceNetworkOutput("force_network")
  )
))