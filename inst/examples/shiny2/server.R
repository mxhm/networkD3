library(shiny)
library(networkD3)

data(MisLinks)
data(MisNodes)

shinyServer(function(input, output) {
  
  clickLinkAction <- 'Shiny.onInputChange(el.id + "_clickededge", { source: d.source.name, target: d.target.name });'  
  clickNodeAction <- 'Shiny.onInputChange(el.id + "_clickednode", d.name);'
  
  output$force_network <- renderForceNetwork({
  forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
               Target = "target", Value = "value", NodeID = "name",
               Group = "group", opacity = 1, opacityNoHover = 0.8, zoom = F, bounded = T,
               fontSize = 9,
               clickNodeAction = clickNodeAction,
               clickLinkAction = clickLinkAction)
  })
  
  output$node <- renderText({
    print(input$force_network_clickednode)
    input$force_network_clickednode
  })
  
  output$edge <- renderText({
    print(input$force_network_clickededge)
    paste0(input$force_network_clickededge$source, " ---> ", input$force_network_clickededge$target)
  })
  
})