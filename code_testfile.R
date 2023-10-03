
if (!requireNamespace("RefManageR", quietly = TRUE)) {
  install.packages("RefManageR") }
if (!requireNamespace("bibliometrix", quietly = TRUE)) {
  install.packages("bibliometrix")}



################################################################################

#Print the references:

#This results in a list of citations that can be easily accessed in the list -> possible use to make the names of our members bold
library(RefManageR)
bib_file <- ReadBib("LMUOpenScienceCenter_MembersPublications.bib")
bib_file[i_true]
#bib_file[i_true] -> results in the right citation



################################################################################

# Load the jsonlite library
library(jsonlite)
# Load the data and reduce it to the items
json_data <- read_json("LMUOpenScienceCenter_MembersPublications_Better.json")
items <- json_data$items


#Going through all the papers we will look at all tags and check if they are m_true or g_true
citation_keys <- c()
i_true <- c()
i = -1
for (item in items) {
  tags <- item$tags
  i <- i + 1
  for (tag in tags) {
    if ("open science" == tag | "g_true" == tag) {
      # If it is, add the corresponding 'citationKey' to 'citation_keys'
      citation_keys <- c(citation_keys, item$citationKey)
      i_true <- c(i_true, i)
    }
  }
}




