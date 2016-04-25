#Read csv file
refine <- read.csv("C:/Users/User/Desktop/refine.csv")View(refine)


#View file header
head(refine)


#View values in Company column
refine$company


#Function to get company name and return corrected name
fix_company <- function(s){
  s <- tolower(s)
  n <- nchar(s)
  last_2char <- substr(s,n-1,n)
  first_2char <- substr(s,1,2)
  
  if(last_2char == 'ps'){
    return('philips')
  }else if(first_2char == 'ak'){
    return('akzo')
  }else if(first_2char == 'va'){
    return('van houten')
  }else{
    return('unilever')
  }
}



#Apply fix_company function to all objects
refine$company <- sapply(refine$company, FUN = fix_company)


#Combine address columns into full_address
refine$full_address <- paste(refine$address, refine$city, refine$country,sep = ', ')


#Remove address, city and country columns
refine$address <- NULL
refine$city <- NULL
refine$country <- NULL


#Reorder columns
refine = refine[,c(1,2,4,3)]


#Save file
write.csv(refine, file="refine_v3.csv")

#Separate product code and number and create new columns

refine_v3 <- separate (refine_v3, Product.code...number, c("prod_code", "prod_number"), sep = "-")


#Save changes to new file
write.csv(refine_v3, file="refine_v4.csv")


#Add prod_category column
look_up_table <- c('p' = 'Smartphone', 'v' = 'TV', 'x' = 'Laptop', 'q' = 'Tablet')
refine_v4$prod_category <- factor(look_up_table[refine_v4$prod_code])
refine_v4$prod_category


#Remove column x and x.1
refine_v4$X <- NULL
refine_v4$X.1 <- NULL



#Save changes as refine_v5
refine_v5 <- refine_v4


#Reorder columns
refine_v5 = refine_v5[,c(1,2,3,6,4,5)]


#Save changes
refine_clean <-refine_v5


#Create csv file
write.csv(refine_clean, file="refine_clean.csv")