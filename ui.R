library(shiny)

shinyUI(fluidPage(
        
        # Application title
        titlePanel("Simple Regression Visualisation"),
        
        # Sidebar with a slider inputs for the intercept ans slope
        sidebarLayout(
                sidebarPanel(
                        h3('Controls for the Simulated Data'),
                        
                        sliderInput('intercept',
                                    'Intercept :',
                                    value = 0, min = -500, max = 500, step = 0.05,),
                        
                        sliderInput('slope',
                                    'Slope :',
                                    value = 0, min = -10, max = 10, step = 0.05,),
                        
                        sliderInput('sdev',
                                    'Noise level :',
                                    value = 0, min = 0, max = 1000, step = 0.05,),
                        
                        helpText("Move sliders to generate points and regression line ",
                                 "The corresponding linear model will be displayed below"),
                        
                        h3('Controls for the Prediction'),
                        
                        sliderInput('predictor',
                                    'Value of x to be predicted :',
                                    value = 0, min = -20, max = 20, step = 0.05,),

                        helpText("Move slider to choose the value for x",
                                 "The corresponding prediction will be displayed under the plot"),
                        

                        h3('Linear Regression Model'),
                        
                        verbatimTextOutput("model")
                        
                ),
                
                # Show plot
                mainPanel(
 
                        plotOutput('points'),
                        
                        h3('Results of prediction'),
                        
                        h4('You choose'),
                        
                        verbatimTextOutput("predictor"),
                        
                        h4('Which resulted in a prediction of '),
                        
                        verbatimTextOutput("prediction")

                )
        )
))