library(shiny)
library(MASS)

shinyServer(
    function(input, output) {
        
        output$dataSummary <- renderPrint({
            summary(Boston)
        })
        
        output$data <- renderDataTable({
            Boston
        }, options = list(pageLength=10))
        
        
        output$model1 <- renderPrint({
            Boston_subset <- Boston[, c(input$predictor, "medv")]
            fit <- lm(medv ~ ., data=Boston_subset)
            summary(fit)
        })

        output$plot1 <- renderPlot({
            Boston_subset <- Boston[, c(input$predictor, "medv")]
            fit <- lm(medv ~ ., data=Boston_subset)
            plot(Boston[,input$predictor], Boston$medv, xlab=input$predictor, ylab="medv")
            abline(fit, col="red")
        
        output$model2 <- renderPrint({
            Boston_subset <- Boston[, c(input$predictors, "medv")]
            fit_multi <- lm(medv ~ ., data=Boston_subset)
            summary(fit_multi)         
        })
    })
    
})