#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

icu_cohort <- 
  readRDS("~/biostat-203b-2022-winter/hw3/mimiciv_shiny/icu_cohort.rds")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("MIMICIV Thirty-Day Mortality Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "variable",
                        label = "Variable of interest:",
                        choices = c(
                          "Ethnicity",
                          "Language",
                          "Insurance",
                          "Marital status",
                          "Gender")
                        )
            ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("barplot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {


    output$barplot <- renderPlot({
      variableinput <- switch(input$variable, 
                                        "Ethnicity" = "ethnicity",
                                        "Language" = "language",
                                        "Insurance" = "insurance",
                                        "Marital status" = "marital_status",
                                        "Gender" = "gender")
      
        ggplot(icu_cohort, aes(thirty_day_mort)) +
        geom_bar(aes_string(fill = variableinput)) + 
          scale_fill_discrete(name = variableinput) + 
          xlab("Thirty day mortality")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
