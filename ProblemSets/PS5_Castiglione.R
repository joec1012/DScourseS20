#PS5 JOSEPH CASTIGLIONE
library(rvest)
library(stringr)
library(dplyr)
library(lubridate)
library(readr)

strengthcoaches<- "https://sports.usatoday.com/ncaa/salaries/football/strength"
html<- read_html(strengthcoaches)
Salary <- html %>% html_node("#content > div.full-width > div > section > div.datatable-wrapper.datatable-wrapper-fixed-column > table") 
Salary.table<-html_text(Salary, trim=FALSE)
view(Salary.table)
#Yahoo Finance API
library(XML)

symbol = "PAYC"
url <- paste('https://finance.yahoo.com/quote/PAYC/analysis?p=PAYC',symbol,sep="")
webpage <- readLines(url)
html <- htmlTreeParse(webpage, useInternalNodes = TRUE, asText = TRUE)
PAYCOMtable <- getNodeSet(html, "//table")

EarningEstimates <- readHTMLTable(PAYCOMtable [[1]])
EevenueEstimates <- readHTMLTable(PAYCOMtable [[2]])
EarningHistory <- readHTMLTable(PAYCOMtable [[3]])
EpsTrend <- readHTMLTable(PAYCOMtable [[4]])
EpsRevisions <- readHTMLTable(PAYCOMtable [[5]])
GrowthEst <- readHTMLTable(PAYCOMtable [[6]])