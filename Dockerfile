# Use an official R runtime as a parent image
FROM rocker/shiny:latest

ENV USER=shiny
ENV HOME=/home/$USER

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y git libxml2-dev libmagick++-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Command to install standard R packages from CRAN; enter the list of required packages for your app here
RUN Rscript -e 'install.packages(c("shiny","tidyverse","log4r","readr","RcppTOML"))'

# Copy and prepare the Shiny application
RUN rm -rf /srv/shiny-server/*
COPY /app/ /srv/shiny-server/

USER $USER
EXPOSE 3838

CMD ["/usr/bin/shiny-server"]