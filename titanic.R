library(dplyr)
library(tidyr)

titanic <- read.csv("titanic_original.csv", na.strings = c("NA", ""))
titanic <- titanic[rowSums(is.na(titanic)) != ncol(titanic),]

titanic$embarked[is.na(titanic$embarked)] <- "S" 

titanic$age[is.na(titanic$age)] <- mean(titanic$age, na.rm = TRUE)

titanic <- mutate(titanic, has_cabin_number = ifelse(cabin == "NA", 0, 1))
titanic$has_cabin_number[is.na(titanic$has_cabin_number)] <- "0"

write.csv(titanic, "titanic_clean.csv")