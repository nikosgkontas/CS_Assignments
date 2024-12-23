# A. Read the dataset "StudentData", inspect it using the str() function.
# insert the data set
data <- read.csv("C:/path/to/file.csv")
# inspect the data set
str(data)

# B. Remove the non-numeric attributes of the initial dataset by creating a new subset called "StudentDataNumeric", including only the attributes with numeric values.
# create the numeric subset
StudentDataNumeric <- data[sapply(data, is.numeric)]
# inspecct the new data set
str(StudentDataNumeric)

# C. Use the "StudentDataNumeric" subset to calculate the correlation matrix (using Pearson's coef). Visualize the identified correlation matrix by creating the corresponding heatmap.
# calculate the Pearson correlation matrix
cor_matrix <- cor(StudentDataNumeric, method = "pearson")
cor_matrix
# create the heatmap
heatmap(cor_matrix,
        main = "Correlation Matrix Heatmap",
        Rowv = NA, Colv = NA,
        margins = c(5, 5))

# D. Fetch the Pearson's rank correlation coefficient for the pairs Attendance-Hours_Studied, Attendance-Exam_Score, Tutoring_Sessions-Previous_Scores, Physical_Activity-Sleep_Hours.

cat("Correlation Attendance-Hours_Studied:",cor(StudentDataNumeric$Attendance, StudentDataNumeric$Hours_Studied, method = "pearson"),"\n")
cat("Correlation Attendance-Exam_Score:",cor(StudentDataNumeric$Attendance, StudentDataNumeric$Exam_Score, method = "pearson"),"\n")
cat("Correlation Tutoring_Sessions-Previous_Scores:",cor(StudentDataNumeric$Tutoring_Sessions, StudentDataNumeric$Previous_Scores, method = "pearson"),"\n")
cat("Correlation Physical_Activity-Sleep_Hours:",cor(StudentDataNumeric$Physical_Activity, StudentDataNumeric$Sleep_Hours, method = "pearson"),"\n")

