#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("MIMICIV Thirty-Day Mortality Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("variable",
                        "Variable of interest:",
                        choices = c(
                          "Ethnicity" = "ethnicity",
                          "Language" = "language",
                          "Insurance" = "insurance",
                          "Marital status" = "marital_status",
                          "Gender" = "gender")
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
        a <- icu_cohort %>% icu_cohort %>% ggplot(aes(thirty_day_mort))
        a + geom_bar(aes(fill = input$variable)) + 
          scale_fill_discrete(name = input$variable) + 
          xlab("Thirty day mortality")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)