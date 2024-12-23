# A. Inspect the dataset and find the number of dataset records, the number of numeric attributes, 
# and the value of the attribute "Disease" of the 3rd record.

# insert the data set
data <- read.csv("C:/path/to/file.scv")
# inspect the data set
str(data)
# see the first rows
head(data)

# B. Create a contigency table with absolute frequencies for attributes "Fever" and "Cough".
# The table should also include the sum of each row/column.
cont_table <- table(Fever = data$Fever, Cough = data$Cough)
c_table <- addmargins(cont_table)
c_table

# C. Create a bar chart showing the frequency of existence (Yes) or absence (No) 
# of symptom "Fatigue" among the patients.
barplot(table(data$Fatigue),  
        main = "Frequency of Fatigue",
        xlab = "Existence (Yes) or Absence (No)",
        ylab = "Frequency",
        names.arg = c("No", "Yes"))

# D. Create a pie chart to show the distribution of patients across different "Cholesterol Level" categories.
pie(table(data$Cholesterol.Level),
    main = "Cholesterol Levels")

# E. Create box plots to show the age distribution of patients with different diseases.
boxplot(data$Age ~ data$Disease,
        main = "Age Distribution of Diseases",
        xlab = "Disease",
        ylab = "Age",
        las = 2,
        cex.axis = 0.6)


