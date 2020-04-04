
install.packages('shiny')

library(shiny)

# Create the UI
ui <- fluidPage('hello word')

# Create the server
server <- function(input, output) {}

# Create the shiny app
shinyApp(
  ui = ui,
  server = server
)

# Create a UI with I/O Controls
ui <- fluidPage(
  titlePanel('Input and Output'),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = 'num',
        label = 'Choose a number',
        min = 0,
        max = 100,
        value = 25
      )
    ),
    mainPanel(
      textOutput(
        outputId = 'text'
      )
    )
  )
)

# Create a server that maps input to output
server <- function (input, output) {
  output$text <- renderText({paste('You selected ', input$num)})
}


# Create the shiny app
shinyApp(
  ui = ui,
  server = server
)
