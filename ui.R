library(shiny)

shinyUI(fluidPage(
  titlePanel("BMI Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      
      h5("1. Select your height in feet and inches."),
      selectizeInput('feet', 'feet:', choices = 0:10),
      selectizeInput('inches', 'inches:', choices = 0:11),
      
      br(),
      
      h5("2. Enter your weight in pounds."),
      textInput('pounds', 'lbs:'),
      
      br(),
      
      actionButton('goButton','Calculate BMI')  
      ),
    
    mainPanel(
      h4("What is BMI?"),
      p("BMI (Body Mass Index) is a measure of weight proportionate to height. 
         Generally, BMI is considered an effective way to evaluate a person's degree of obesity. 
         The index is calculated simply using one's height and weight."),
      
      br(),
      
      h4("BMI Ranges"),
      h5("Underweight: 18.5 or less"),
      h5("Normal weight: 18.5 ~ 24.9"),
      h5("Overweight: 25 ~ 29.9"),
      h5("Obesity: 30 or greater"), 
      
      br(),
      
      h4("Your Result"),
      h5(strong('You have entered:')),
      textOutput("userinput"),
      h5(strong('Which resulted in:')),
      textOutput("result")
      )
  )
))