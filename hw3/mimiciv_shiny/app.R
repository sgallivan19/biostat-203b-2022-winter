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

ui <- fluidPage(title = "Distributions of Variables",
      tabsetPanel(tabPanel(title = "Thiry Day Mortality by Demographics",
                    plotOutput("barplot"),
                    selectInput(inputId = "variable",
                    label = "Variable of interest:",
                    choices = c(
                    "Ethnicity",
                    "Language",
                    "Insurance",
                     "Marital status",
                      "Gender"))),
                   tabPanel(title = "Lab Measure Distributions",
                                     plotOutput("histo"),
                                     sliderInput(inputId = "bins",
                                                 label = "Number of bins:",
                                                 min = 1,
                                                 max = 100,
                                                 value = 50),
                  selectInput(inputId = "histvariable",
                              label = "Variable of interest:",
                              choices = c(
                                "Creatinine",
                                "Potassium",
                                "Sodium",
                                "Chloride",
                                "Bicarbonate",
                                "Hematocrit",
                                "White blood cell count",
                                "Glucose",
                                "Magnesium",
                                "Calcium"))
                              
                            )
                  
                )
)
# Define UI for application
# ui <- fluidPage(
# 
#     # Application title
#     titlePanel("MIMICIV Thirty-Day Mortality Data"),
# 
#     # Sidebar with a choice input  
#     sidebarLayout(
#         sidebarPanel(
#             selectInput(inputId = "variable",
#                         label = "Variable of interest:",
#                         choices = c(
#                           "Ethnicity",
#                           "Language",
#                           "Insurance",
#                           "Marital status",
#                           "Gender")
#                         )
#             ),
# 
#         # Show a plot of the generated distribution
#         mainPanel(
#            plotOutput("barplot")
#         )
#     )
# )

# Define server logic required to draw barplot
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
     output$histo <- renderPlot({
       histovar <- switch(input$histvariable,
                          "Creatinine" = "lab50912",
                          "Potassium" = "lab50971",
                          "Sodium" = "lab50983",
                          "Chloride" = "lab50902",
                          "Bicarbonate" = "lab50882",
                          "Hematocrit" = "lab51221",
                          "White blood cell count" = "lab51301",
                          "Glucose" = "lab50931",
                          "Magnesium" = "lab50960",
                          "Calcium" = "lab50893")
       
       ggplot(icu_cohort, aes(histovar))
       geom_histogram(bins = input$bins)
       
     })
 }

# Run the application 
shinyApp(ui = ui, server = server)

