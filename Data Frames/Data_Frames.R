# A. Load the Pokedex dataset, inspect it using str() function and remove the column containing the image path.
# Then, set the row names according to the contents of attrinute "Name" and remove this column afterwards.
# Finally, fetch the entire crecord of the Pokemon named "Omastar".
# insert the data set 
pokedex <- read.csv("C:/path/to/file.csv")
# inspect the data set
str(pokedex)
# we drop the Image attribute
data <- pokedex[!names(pokedex) %in% "Image"]
# inpsect the new data set
str(data)
head(data)
# we set the row names to the Name column
rownames(data) <- data$Name
# we remove the Name column
data <- data[, !names(data) %in% "Name"]
head(data)
#we fetch the record of pokemon Omastar
omastar <- data["Omastar", ]
#print the results
print(omastar)

# B. Identify the numbe of Pokemon that do not have a second type.
# Then, identify the number of Pokemon whose "Speed" is less than 60.
#pokemons without type2
sum(is.na(data$Type.2) | data$Type.2 == "")
#pokemons with speed less than 60
sum(data$Speed < 60)

# C. Calculate the average attack value of all "Water" type Pokemon (type1 or type2).
# Identify the name of the "Fairy" type Pokemon (type1 or type2) with the greatest "HP" value.
#average attack type for Water type
average_attack_water <- mean(data$Attack[data$Type.1 == "Water" | data$Type.2 == "Water"])
print(average_attack_water)
#filter the Fairy pokemons
fairy_pokemon <- data[data$Type.1 == "Fairy" | data$Type.2 == "Fairy",]
fairy_pokemon[which.max(fairy_pokemon$HP),]

# D. Calculate the normalized values fot attributes "HP", "Attack". "Defence" using the min-max formula and insert them in three new columns named "NormHP", "NormAttack", NormDefence" respectively.
# Find the names of Pokemon with the 3 highest NormHP values, the median value of NormAttack, the average value of NormDefence.

# we create a function for the min-max normalization
min_max <- function(x) {(x - min(x)) / (max(x) - min(x))}
# then we procced to the normalizations
data$NormHP <- min_max(data$HP)
data$NormAttack <- min_max(data$Attack)
data$NormDefense <- min_max(data$Defense)
# top 3 NormHP
data[order(-data$NormHP),][1:3,]
# median of NormAttack
median(data$NormAttack)
# average of NormDefence
mean(data$NormDefense)

# E. Calculate and insert in a new column the values of a new metric called "Performance" defined as the NormHP*NormAttack*NormDefense + 0.0002. 
# Create a new ordinal attribute called "Grade" which may take the values "Weak", "Normal" and "Strong" that correspond to the following intervals (0, 0.15], (0.15, 0.2], and (0.2, 1], for the values of the Performance attribute respectively.
# we create and calculate Performance
data$Performance <- (data$NormHP * data$NormAttack * data$NormDefense) + 0.0002
# we create the attribute Grade
data$Grade <- cut(data$Performance,
                  breaks = c(0, 0.15, 0.2, 1),
                  labels = c("Weak", "Normal", "Strong"))
# how many with strong grade
strong <- sum(data$Grade == "Strong", na.rm=TRUE)
strong
# grade of Haunter
haunter_grade <- data["Haunter", "Grade"]
haunter_grade
