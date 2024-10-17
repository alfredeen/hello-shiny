# hello-shiny
A simple Shiny example app.

## Trunk based workflow
In this repo, we work [Trunk based](https://www.toptal.com/software/trunk-based-development-git-flow), which means that we bypass the dev branch.

## Begin

If not already in the project folder, open a terminal and navigate there

    cd ./hello-shiny


## Build and run a docker image locally

    docker build -t hello-shiny:dev .

Run the container

    docker run --rm -p 127.0.0.1:3838:3838 hello-shiny:dev

Browse to the app at  http://localhost:3838/


## Running the app in R terminal

Pre-requisites

    Install R, the R language server and R Shiny.
    In VSCode, can install the Shiny extension.

Open an R terminal and then run these commands

    setwd("hello-shiny")

Install the R packages

    install.packages("log4r")
    install.packages("RcppTOML")
    install.packages("readr")
    library(shiny)

Run the R app

    runApp("app")
