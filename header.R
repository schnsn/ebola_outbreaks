#### this is just a basic script that scrapes ebola-outbreak data from wikipedia
#### and plots it using ggplot2
#### licensed under WTFPL: http://www.wtfpl.net/about/

## clean up first:
rm(list = ls(all = TRUE))
dir.create(path = "./plots", showWarnings = FALSE)

## check for, install, and load needed packages:
if (!'ggplot2' %in% installed.packages()) install.packages("ggplot2", dependencies=TRUE)
if (!'reshape2' %in% installed.packages()) install.packages("reshape2", dependencies=TRUE)
if (!'dplyr' %in% installed.packages()) install.packages("dplyr", dependencies=TRUE)
if (!'XML' %in% installed.packages()) install.packages("XML", dependencies=TRUE)
library(ggplot2)
library(ggvis)
library(reshape2)
library(dplyr)
library(XML)

## read ebola-outbreak data from wikipedia:
ebola_data <- readHTMLTable(doc="http://en.wikipedia.org/wiki/List_of_Ebola_outbreaks")
ebola_data <- ebola_data[[1]]
ebola_data <- ebola_data[apply(ebola_data, 1, function(row) all(row !=0 )),]
names(ebola_data) <- c("Year", "Country", "Type", "Cases", "Deaths", "Fatality", "Description")
ebola_data$Year <- substr(ebola_data$Year, 0, 4)
ebola_data$Year <- as.numeric(as.character(ebola_data$Year))
ebola_data$Deaths <- as.numeric(as.character(ebola_data$Deaths))
ebola_data$Cases <- as.numeric(as.character(ebola_data$Cases))
ebola_data$Country[c(1,3,6)] <- "Democratic Republic of Congo"
ebola_data <- droplevels(ebola_data)
# ebola_data$Country[20] <- "Guinea/Liberia/Sierra Leone"     # why does this not work?!
