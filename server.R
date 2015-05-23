# server.R

bmi <- function(f,i,p) {
  if (is.na(p)) return("You have not entered.")
  else round(703*p/((f*12+i)^2),1)
}
category <- function(x) {
  if (is.character(x)) return(" ")
  else if (x <= 18.5) return("Underweight")
  else if (x > 18.5 & x < 25) return("Normal Weight")
  else if (x >= 25 & x < 30 ) return("Over Weight")
  else return("Obesity")
}

shinyServer(function(input, output) {
  
  datafeet <- reactive({as.numeric(input$feet)})
  datainches <- reactive({as.numeric(input$inches)})
  datapounds <- reactive({as.numeric(input$pounds)})
  bmiindex <- reactive({bmi(datafeet(), datainches(), datapounds())})
#   finalInput <- reactive({
#     if(!input$adjust) return(dataInput())
#     adjust(dataInput())
#   })
#   
  output$userinput <- renderText({ 
    input$goButton
    isolate(paste("Height: ", input$feet, "feet", input$inches, "inches, Weight:", input$pounds, "lbs"))
  })

  output$result <- renderText({
    input$goButton
    isolate(paste(bmiindex(), category(bmiindex())))
  })

})