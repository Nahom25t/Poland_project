library(shiny)
library(bslib)
library(tidyverse)
library(ggplot2)
# Define UI for app that draws a histogram ----


ui <- page_navbar(
  title = "Poland",
  bg = "#2D89C8",
  sidebar = sidebar(
    name = "Sidebar",
    selectInput(
      inputId = "mySelectinput",
      label = ("Choose a variable to disply"),
      choices = c("Percent White", "Percent Black", "Percent Hispanic", "Percent Asian")      
    ),
    sliderInput(
      inputId = "slider",
      label = ("Range of interest"),
      min = 0,
      max = 100,
      value = 50,
    
      )
    ),
  layout_columns(
    card(card_header("Card Header"),"Card body"),
    # card(card_header("Card Header"),"Card body"),
    # card(card_header("Card Header"),"Card body"),
    card("Another Card"),
  ),
  value_box(
    title = "Poland",
    value = 100,
    # showcase = bsicons::bs_icon("bar_chart"),
    theme = "teal",
  ),
  # nav_panel(title = "One", p("First page content.")),
  # # nav_panel(title = "Two", p("Second page content.")),
  # # nav_panel(title = "Three", p("Third page content.")),
  nav_spacer(),
  nav_menu(
    title = "Links",
    align = "right",
    nav_item(tags$a("Posit", href = "https://posit.co")),
    nav_item(tags$a("Shiny", href = "https://shiny.posit.co"))
  ),
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  observeEvent(input$mySelectinput,{
    print(paste("The user selected:", input$mySelectinput))
  })
  
}

# Create and run the Shiny app ----
shinyApp(ui = ui, server = server)