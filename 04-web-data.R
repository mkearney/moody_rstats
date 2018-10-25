
## TWO KINDS OF INTERNET DATA
##
## (1) Unstructured - collect via web scraping
## (2) Structured - collect via APIs

##----------------------------------------------------------------------------##
##                                WEB SCRAPING                                ##
##----------------------------------------------------------------------------##


## Web scraping
##   - **{rvest}** `xml2::read_html()`
##   - Using "inspect(or)" in web browser
##   - `html_nodes()`, `html_text()`, `html_table()`

## A normal web scraping workflow goes something like the following:
## (1) Read into an R environment the website source code, known as Extensible Markup
##     Language (XML), associated with a specified URL. XML is similar to HTML only its
##     designed for storing rather than displaying data.
## (2) Parse the XML document via elements (e.g., <p>...</p>) and attributes (e.g., <h1
##     screen-name="internet_user">). Elements, or the nodes used to extract certain
##     sections of source code, can be identified with tags (name of HTML tag, e.g.,  p),
##     classes (denoted with an initial period, e.g., .post), and ids (denoted with an
##     initial pound sign, e.g., #main) as according to CSS selectors or XPath.
## (3) Organize parsed values into lists, data frames, etc.

## Web scraping in R
## The {rvest} package makes web scraping in R easy:
library(rvest)


## The two most important functions are read_html(), which is actually imported
## from the {xml2} package by {rvest}, and html_nodes().
## + read_html() reads the content associated with a given URL into an R session
##   and then stores it as an object of class xml_document.
(h <- read_html("https://www.tiobe.com/tiobe-index/r/"))

### + html_nodes() filters an xml document by CSS selector(s) or XPath values.
h %>%
  html_nodes("div p")

## Other useful functions include...
##    - html_text() for extracting text,
##    - html_attr() for extracting XML attribute values
##    - html_table() for extracting tables
## + Example: return the paragraph text
h %>%
  html_nodes("div p") %>%
  html_text(trim = TRUE)

## + Example: return attribute value
h %>%
  html_nodes("img") %>%
  html_attr("width")

## More in-depth examples of web scraping using the {httr} package can be found
## in lots of good blog posts.

##----------------------------------------------------------------------------##
##                                  WEB APIS                                  ##
##----------------------------------------------------------------------------##

## + APIs
##   - **{httr}** `GET()` and `POST()`
##   - **{oauth}** authorization keys and tokens
##   - **{jsonlite}** `fromJSON()`
## + Examples
##   - **{nytimes}**
   - **{newsAPI}**
   - **{propublica}**

## Web APIs
##
## + Structured data is governed by Application Program Interfaces (APIs)
## + API requests look a lot like the URLs
##    - Same protocol; scheme, hostname, path (endpoint), query
##
## Authorization
## + Many APIs require authorization

## APIs are similar to web browsers but with different purpose:
##   - Web browsers **render** content
##   - Web APIs manage and organize **data**
