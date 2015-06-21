library(shiny)

shinyUI(fluidPage(
    
    titlePanel(
        h3("Shiny Project - Linear Regression")
        ),
    
    sidebarLayout(
        sidebarPanel(
            br(),
            h4("Linear Regression with Single Predictor"),
            selectInput("predictor", label = h5("Select a predictor"),
                choices=list("crim","zn","indus","chas","nox","rm","age","dis", 
                             "rad","tax","ptratio","black","lstat")),
            br(),
            h4("Linear Regression with Multiple Predictors"),
            checkboxGroupInput("predictors", label = h5("Select predictors"), 
                               choices = list("crim","zn","indus","chas","nox","rm","age","dis", 
                                              "rad", "tax","ptratio","black","lstat"),
                               selected = c("crim", "zn"))
            ),
        
    mainPanel(width=8,
        tabsetPanel(
            tabPanel('Introduction',
                     br(),
                     p('This is a shiny demo on linear regression model. Boston data set in MASS library is used in the project.
                       The response variable in the model is', strong('medv:'),'median value of owner-occupied homes in $1000s.'),
                     p('The predictor variables are:'),
                     tags$ul(
                         tags$li(strong("crim:"),"per capita crime rate by town"),
                         tags$li(strong("zn:"),"proportion of residential land zoned for lots over 25,000 sq.ft"),
                         tags$li(strong("indus:"),"proportion of non-retail business acres per town"),
                         tags$li(strong("chas:"),"Charles River dummy variable"),
                         tags$li(strong("nox:"),"nitrogen oxides concentration"),
                         tags$li(strong("rm:"),"average number of rooms per dwelling"),
                         tags$li(strong("age:"),"proportion of owner-occupied units built prior to 1940"),
                         tags$li(strong("dis:"),"weighted mean of distances to five Boston employment centres"),
                         tags$li(strong("rad:"),"index of accessibility to radial highways"),
                         tags$li(strong("tax:"),"full-value property-tax rate per $10,000"),
                         tags$li(strong("ptratio:"),"pupil-teacher ratio by town"),
                         tags$li(strong("black:"),"1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town"),
                         tags$li(strong("lstat:"),"lower status of the population")
                         ),
                     p('The', strong('Data Summary'),'tab displays the full data set and provide a summary of the data'),
                     p('Both single variable and multi-variable linear regression models are available.
                       For single variable linear regression model, select a predictor in the left panel,
                       and the corresponding model is shown in the', strong('Single Variable Linear Regression Model'), 'tab.
                       Plot of response and predictor variables with regression line is displayed as well.
                       For multi-variable linear regression model, select predictors in the left panel, 
                       and the corresponding model is shown in the', strong('Multi Variable Linear Regression Model'), 'tab.')
                     ),
            tabPanel('Data Summary',
                     br(),
                     h4('Boston Data Set'),
                     dataTableOutput('data'),
                     br(),
                     h4('Data Summary'),
                     verbatimTextOutput('dataSummary')
                ),
            tabPanel('Single Variable Linear Regression Model',
                     br(),
                     h4('Model Summary'),
                     verbatimTextOutput("model1"),
                     br(),
                     h4('Plot'),
                     plotOutput("plot1")),
            tabPanel('Multi Variable Linear Regression Model',
                     br(),
                     h4('Model Summary'),
                     verbatimTextOutput("model2"))
        )
    ))
))
