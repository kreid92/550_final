###### STAGE 1 ######

FROM rocker/tidyverse:4.5.1 AS base

RUN mkdir /home/rstudio/project 
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN Rscript -e "renv::restore(prompt = FALSE)"

###### STAGE 2 ######

FROM rocker/tidyverse:4.5.1

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /home/rstudio/project

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

COPY Makefile /home/rstudio/project 
COPY Final_Reid.Rmd /home/rstudio/project 

RUN mkdir /home/rstudio/project/code 
RUN mkdir /home/rstudio/project/output 
RUN mkdir /home/rstudio/project/raw_data 
RUN mkdir /home/rstudio/project/report

COPY raw_data/pregnancy_covid_pandemic.csv /home/rstudio/project/raw_data
COPY ./code /home/rstudio/project/code 


CMD make && mv Final_Reid.html /home/rstudio/project/report