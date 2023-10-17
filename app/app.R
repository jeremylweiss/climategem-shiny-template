

# <App description>

# Add code for the following
# 
# 'climategem-shiny-template.html': <!-- Google tag (gtag.js) -->
# 'climategem-shiny-template.html': <!-- CSS specific to this climateGEM Shiny app -->

# Edit the following [in square brackets]:
# 
# 'climategem-shiny-template.html': <title>[Web Application Title] | climateGEM</title>
# 'climategem-shiny-template.html': <h1 class="hidden title"><span class="field field--name-title field--type-string field--label-hidden">[Hidden Title]</span></h1>
# 'climategem-shiny-template.html': <article role="article" about="[/application-areas]" class="node node--type-az-flexible-page node--view-mode-full clearfix">
# 'climategem-shiny-template.html': <span class="lm-az"></span>
# 'climategem-shiny-template.html': <h1 class="mt-4 d-inline">[Web Tool Name]</h1>
# 'climategem-shiny-template.html': <h4 class="mb-0 mt-2">[High-level text summary]</h4>


# Libraries
library(dplyr)
library(htmltools)
library(lubridate)
library(shiny)
library(vroom)

# Functions
#source("./R/fxnABC.R", local = TRUE)

# Scripts
#source("./R/scr##DEF.R", local = TRUE)


# UI --------------------

ui <- htmltools::htmlTemplate(
  
  "climategem-shiny-template.html",
  
  sidebarLayout = sidebarLayout(
    position = "left",
    
    sidebarPanel(
      id = "sidebarPanel",
      width = 4,
      
      verticalLayout(
        selectInput("dataset", label = "Dataset", choices = ls("package:datasets"))
      )
    ), # sidebarPanel()
    
    mainPanel(
      id = "mainPanel",
      width = 8,
      
      verbatimTextOutput("summary"),
      tableOutput("table")
    ) # mainPanel()
  ) # sidebarLayout()
) # htmltools::htmlTemplate()


# Server --------------------

server <- function(input, output, session) {
  
  # Reactive events -----
  
  # Outputs -----
  
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}

# Run --------------------

shinyApp(ui = ui, server = server)