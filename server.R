library(shiny)

set.seed(1)

shinyServer(
        function(input, output) {
                
                output$points <- renderPlot({
                        
                        x <- runif(40,-20,20)
                        
                        intercept <- input$intercept
                        
                        slope <- input$slope
                        
                        sdev <- input$sdev
                        
                        noise <- rnorm(length(x), sd=sdev)
                        
                        y <- intercept + slope * x + noise
                        
                        plot(x,y,pch=19,col="blue",main="Simulated Data")
                        
                        fit <<- lm(y ~ x)
                        
                        abline(fit, col="red")

                        output$model <- renderPrint({fit})
                        
                })
                
                
                
                observe({
                        
                        predictor <- input$predictor
                        
                        prediction <- predict(fit, data.frame(x=predictor))
                        
                        output$prediction <- renderPrint({prediction})
                                                
                        output$predictor <- renderPrint({predictor})
                })
        }
)