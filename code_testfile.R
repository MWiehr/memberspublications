
if (!requireNamespace("RefManageR", quietly = TRUE)) {
  install.packages("RefManageR") }
if (!requireNamespace("bibliometrix", quietly = TRUE)) {
  install.packages("bibliometrix")}



################################################################################

#Setup

#This results in a list of citations that can be easily accessed in the list -> possible use to make the names of our members bold
library(RefManageR)
bib_file <- ReadBib("LMUOpenScienceCenter_MembersPublications.bib")

#loading the bib file in its complete format
library(bibliometrix)
bib_data <- convert2df("LMUOpenScienceCenter_MembersPublications.bib")


################################################################################

# Install and load the 'bibtex' package if not already installed
if (!requireNamespace("bibtex", quietly = TRUE)) {
  install.packages("bibtex")
}

# Load the 'bibtex' package
library(bibtex)

# Specify the path to your BibTeX file
bibtex_file <- "LMUOpenScienceCenter_MembersPublications.bib"

# Read the BibTeX file
bib_data <- read.bib(bibtex_file)

# Create a text file and write the titles and keys to it
output_file <- "output.txt"
writeLines(paste(bib_data$entryTags$title, "(", names(bib_data$entryTags), ")", sep = " "), output_file)

cat("Conversion completed. Results written to", output_file, "\n")

################################################################################

# Load the jsonlite library
library(jsonlite)
# Load the data and reduce it to the items
json_data <- read_json("LMUOpenScienceCenter_MembersPublications_Better.json")
items <- json_data$items


#Going through all the papers we will look at all tags and check if they are m_true or g_true
citation_keys <- c()
for (item in items) {
  tags <- item$tags
  for (tag in tags) {
    if ("m_true" == tag | "g_true" == tag) {
      # If it is, add the corresponding 'citationKey' to 'citation_keys'
      citation_keys <- c(citation_keys, item$citationKey)
    }
  }
}






number_not_rated <- 0
list_meets-criteria


# Filter items based on the "open science" tag
filtered_items <- items[sapply(items$tags, function(tag) any(tag$tag == "open science")), ]

# Extract the citationKeys from the filtered items
citationKeys <- filtered_items$citationKey

# Print the citationKeys
print(citationKeys)

