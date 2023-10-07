
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

#Work in progress on the boldedversion

#Idea: use the jason to  manually add all the strings together forming the reference 
#Possible Problems: There are different kinds of references needed

#1 For i in i_true: Add a reference 
# This is my example reference: Grady, J. S., Her, M., Moreno, G., Perez, C., & Yelinek, J. (2019). Emotions in storybooks: A comparison of storybooks that represent ethnic and racial groups in the United States. Psychology of Popular Media Culture, 8(3), 207–217. https://doi.org/10.1037/ppm0000185
#Lastname, Firstletter., ... . (Year). title, pages. https://DOI
references <- c()
for (item in items) { 
  nameallmembers <- "Names"
  year <- result <- substr(gsub("[A-Za-z]", "", item$date[1]), 1, 4) #additionaly deleting the month and day from the date to fit the citation
  title <- item$title[1]
  pagenumbers <-paste( item$volume[1] , "," , item$pages[1])
  doi <- item$DOI[1]
  
  reference <- paste(nameallmembers, "(",year,"). " , title , pagenumbers , ". https://" , doi)
  #reference <- iterate through allcreator in creators if firstname lastname pair not in our memberslist add creator[firstname] + ". " + creator[lastname] + ", " else name <- creator[firstname] + ". " + creator[lastname] + ", "  add "**" + name + "**" 

  
  references <- c(references, reference)
}
str1 <- "Hello "
str2 <- "world"
result <- paste(str1,str2)
################################################################################

# Load the jsonlite library
library(jsonlite)
# Load the data and reduce it to the items
json_data <- read_json("LMUOpenScienceCenter_MembersPublications_Better.json")
items <- json_data$items


#Going through all the papers we will look at all tags and check if they are m_true or g_true
citation_keys <- c()
i_true <- c()
i = 0
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




