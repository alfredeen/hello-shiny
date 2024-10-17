library(shiny)
library(readr)
library(log4r)
library(RcppTOML)

print(paste("Begin app.R. Running in working dir =", getwd()))

# Setup logging
log_level <- "DEBUG"
logger <- log4r::logger(log_level)
log4r::info(logger, paste("START app.R. Logging enabled with log level =", log_level))

log4r::info(logger, "debug test")

# App version
# Get the version nr from the project toml file
ver <- "unset"
project_filename <- "project.toml"

tryCatch({
  fd <- read_file(project_filename)
  toml <- parseTOML(fd, verbose = FALSE, fromFile=FALSE, includize=FALSE, escape=TRUE)
  ver <- toml["app"]$app$version
  log4r::info(logger, paste("Running app version =", ver))
}, error=function(e) {
  log4r::warn(logger, e)
}, warning=function(e) {
  log4r::warn(logger, e)
})



# Define UI for app
ui <- fluidPage(

  # App title
  titlePanel("Hello Shiny!"),

  # Main panel
  mainPanel(
    "Hello, world!"
  ),

  # Footer
  hr(),
  div(
      class = "footer",
      paste("version ", ver)
  )
)

# Define server logic
server <- function(input, output, session) {
}

# Run the Shiny app
shinyApp(ui, server)