setwd("C:/Users/krisa/Desktop/Data_Course/data/Data_Course/data/")
list.files()[1:5]

df = read.csv("Fake_grade_data.csv")
names(df)

View(df)

df$Total_Points = rowSums(df[3:17])#creating a new column and adding up columns 3-17


row.names(df)<-df$Student
names(df)
#df$Total_Points = rowSums(df[])
df[,-c(1,2)]

df$Total_Points = rowSums(df)


A = df[df$Total_Points >= 700,]

?arrange #will rearrange columns - they are usually variables, so you use this action less
?order
order(A$Total_Points) # for the rows
A[order(A$Total_Points, decreasing = TRUE),]#switch the order to descend

?sort

sort(A$Total_Points)
sample(df$Total_Points,3) # if you add a number like 3, it will randomly pull out three from this data set


#set.seed(10) what is this????