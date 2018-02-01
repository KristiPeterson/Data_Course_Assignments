library(ggplot2)
library(dplyr)
setwd("C:/Users/krisa/Desktop/Data_Course")
getwd()
setwd("C:/Users/krisa/Desktop/Data_Course/Exam_1")
getwd()
data = read.csv("DNA_Conc_by_Extraction_Date.csv.gz")


#task 1 BOXPLOT
?boxplot

katy = data$DNA_Concentration_Katy
kPlot = boxplot(katy, data = data$DNA_Concentration_Katy)

qplot(katy, geom="histogram")

ben = data$DNA_Concentration_Ben
class(ben)

#examplegplot(chol$AGE, geom="histogram")
ggplot(data=data$ben, aes(data$ben)) + 
  geom_histogram()

##################TASK 2######################
#KATY
katy_year = data.frame(data$Year_Collected, data$DNA_Concentration_Katy)


class(data$Year_Collected)
class(data$DNA_Concentration_Katy)
#I thought that if they were different classes then they would automatically plot the way you have on your jpegs
katyPlot = ggplot(katy_year, mapping = aes(x= data$Year_Collected, y = data$DNA_Concentration_Katy))+
  geom_point()


#BEN
ben_year = data.frame(data$Year_Collected, data$DNA_Concentration_Ben)
ggplot(ben_year, mapping = aes(x= data$Year_Collected, y = data$DNA_Concentration_Ben))+
  geom_point()


##################TASK 3##########################

#save as jpegs
?jpeg()
#jpeg will open a window in your computer, and feed information into it and then do dev.off() to close connection
jpeg(filename = "C:/Users/krisa/Desktop/Data_Course_Assignments/Katys_Data.jpeg")
plot(katy_year, main = "Katy's Data", xlab = "Year Collected", ylab = "DNA Concentration")
dev.off() #closes the window portal


jpeg(filename = "C:/Users/krisa/Desktop/Data_Course_Assignments/Bens_Data.jpeg")
plot(ben_year, main = "Ben's Data", xlab = "Year Collected", ylab = "DNA Concentration")
     
dev.off() #closes the window portal

################TASK 4############################
#To that end, I want you to make a new data frame (just using Ben's values) 
#that has one column containing the years that DNA extractions were made,
#STEP 1and another column that contains the AVERAGE of the values within that year.  
#Just to be clear, this data frame should have only 12 rows (one for each year).

#STEP 2Once you have this new data frame of averages by year, write some code that shows 
#STEP 3which extraction year has the highest average DNA concentration (and what that concentration is)
       
#step 1                                           

#renaming ben_year to the data frame
df = ben_year

c(ben_year, mean(ben_year$data.Year_Collected, ben_year$data.DNA_Concentration_Ben))
?mean

library(dplyr)

?class
class(ben_year$Year_Collected)
#ben_year$Year_Collected.class <- integer

#averaged every year
avgTotal = df %>% group_by(data$Year_Collected) %>%
  summarize(eachYear = mean(data$DNA_Concentration_Ben)) #column name = function of other column


rowSums(df["2000",df$Year_Collected])
