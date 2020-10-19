### File:         ui.R
### Date:         25Oct2013
### Author:       Joel Chaney
### Description:  This program is one of two files comprising a Shiny app for conducting a one sample proportion test (exact binomial test).

library(shiny)

# In order to run the tool, run the code here in "ui.R" and in "server.R".  Then type "runApp()" at the command line, then open your browser and point to http://<serverName>:8100

# Define UI for application
shinyUI(pageWithSidebar(
  # Application title
  headerPanel("Exact Binomial Test (Test for One Proportion - test)"),
  # Sidebar with controls to select the sample size and probability to plot
  sidebarPanel(
    p("Enter the number of \"successes\" and the total sample size for a single group below, and enter the desired confidence level and alternative hypothesis 
(i.e., statement you would like to make).  The table to the right will be automatically updated with the statistical test results.  This table can be downloaded
in .csv format by clicking on the \"Download the Results\" button."),
    numericInput("s1", "# of Successes:", 12),
    numericInput("t1", "Total Sample Size:", 30),
    sliderInput("confid", "Confidence Level (%):", 50, 99, 95, 1), 
    radioButtons("testType", "Alternative Hypothesis:", c("proportion of successes is not equal to 0.5"="two.sided", "proportion of successes is less than 0.5"="less", 
      "proportion of successes is greater than 0.5"="greater"))
  ),
  # Show the caption and plot
  mainPanel(
    h3(textOutput("Exact Binomial Test")),
    tableOutput("stats"),
    downloadButton('downloadResults', 'Download the Results')
  ))
)
