# Assignment Week 3




# topics:   type conversions, factors, plot(), making a data frame from "scratch",
#           reordering, 


# vector operations!

vector1 = c(1,2,3,4,5,6,7,8,9,10)
vector2 = c(5,6,7,8,4,3,2,1,3,10)

vector1*vector2
vector1+1
vector1+c(1,2) # if you create a vector to add to it then it will just recycle through it.

one = c("one", "two", "three")
two = c("five", "six", "seven")

c(one, two)
?rep
rep("one", 10)
rep(one, 10)
1:10

setwd("C:/Users/krisa/Desktop/Data_Course/data")
list.files()

dat = read.csv("thatch_ant.csv")
names(dat)

#why are these plots different???
plot(x=dat$Headwidth..mm., y=dat$Mass)
plot(x=dat$Size.class, y=dat$Mass)


#check the classes of these vectors
class(dat$Headwidth..mm.)
class(dat$Size.class) #discrete or categorical data example
#factor class- treated different- example plot function to use a box plot


# plot() function behaves differently depending on classes of objects given to it!

# Check all classes (for each column in dat)
str(dat)

# Two of them are "Factor" ....why is the column "Headwidth" a factor? It looks numeric!
levels(dat$Headwidth) #levels only works with factors
# we can try to coerce one format into another with a family of functions
# as.factor, as.matrix, as.data.frame, as.numeric, as.character, as.POSIXct, etc....

#make a numeric vector to play with:
nums = c(1,1,2,2,2,2,3,3,3,4,4,4,4,4,4,4,5,6,7,8,9)
class(nums) # make sure it's numeric

# convert to a factor
as.factor(nums) # show in console
nums_factor = as.factor(nums) #assign it to a new object as a factor
class(nums_factor) # check it

#check it out
plot(nums) 
plot(nums_factor)
# take note of how numeric vectors and factors behave differently in plot()

# Let's modify and save these plots. Why not!?
?plot()
plot(nums, main = "Plot Title", xlab = "My axis label", ylab = "My other axis label",col="Blue") #changes the color to blue
plot(nums, main = "Plot Title", xlab = "My axis label", ylab = "My other axis label",
     col=c(1,2,3),#changes to three different colors
     cex = 5, pch=5) #cex changes the size and pch changes the symbol




?jpeg()
#jpeg will open a window in your computer, and feed information into it and then do dev.off() to close connection
jpeg(filename = "C:/Users/krisa/Desktop/image.jpeg")
plot(nums, main = "Plot Title", xlab = "My axis label", ylab = "My other axis label",
     col=c(1,2,3),#changes to three different colors
     cex = 5, pch=5)
dev.off() #closes the window portal

?dev.off

# back to our ant data...
dat$Headwidth
levels(dat$Headwidth) # levels gives all the "options" of a factor you feed it
?find
# I notice a couple weird ones in there: "" and "41mm"
# The "" means a missing value, basically. The "41mm" sure looks like a data entry error.
                                            # It should probably be "41.000"

# FIND WHICH ONES HAVE "41mm"

bad = which (dat$Headwidth == "41mm")


# CONVERT THOSE TO "41.000"

dat$Headwidth[bad] = "41.000"

dat$Headwidth = as.numeric(dat$Headwidth)
class(dat$Headwidth)
plot(dat$Headwidth, dat$Mass)
plot(dat$Headwidth..mm.,dat$Mass)

# DO THE SAME FOR "", BUT CONVERT THOSE TO "NA"

which(dat$Headwidth == 1)
zero = which(dat$Headwidth == 1)
dat$Headwidth[zero] = NA

dat2 = na.omit(dat) #erases all the NA's


#na has a bunch of their own commands
?NA

summary(dat$Headwidth)
plot(dat$Headwidth)

# NOW, REMOVE ALL THE ROWS OF "dat" THAT HAVE AN "NA" VALUE
na.omit(dat)


# NOW, CONVERT THAT PESKY "Headwidth" COLUMN INTO A NUMERIC VECTOR WITHIN "dat"



# LET'S LEARN HOW TO MAKE A DATA FRAME FROM SCRATCH... WE JUST FEED IT VECTORS WITH NAMES!

# make some vectors *of equal length* (or you can pull these from existing vectors)
col1 = c("hat", "tie", "shoes", "bandana")
col2 = c(1,2,3,4)
col3 = factor(c(1,2,3,4)) # see how we can designate something as a factor             

# here's the data frame command:
data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # colname = vector, colname = vector....
df1 = data.frame(Clothes = col1, Numbers = col2, Factor_numbers = col3) # assign to df1
df1 # look at it...note column names are what we gave it.



# Make a data frame from the first 20 rows of the ant data that only has "Colony" and "Mass"
# save it into an object called "dat3"





###### WRITING OUT FILES FROM R #######
?write.csv()


# Write your new object "dat3" to a file named "LASTNAME_first_file.csv" in your PERSONAL git repository

write.csv(dat2,file = "C:/Users/krisa/Desktop/clean_dat.csv", row.names = FALSE) #if you do row.names = FALSE then it would erase the first column name 1-10 which is good if your first row name is supposed to be your own column names)


### for loops in R ###

#simplest example:
for(i in 1:10){
  print(i)
}

#another easy one
for(i in levels(dat$Size.class)){
  print(i)
}

# can calculate something for each value of i ...can use to subset to groups of interest
for(i in levels(dat$Size.class)){
  print(mean(dat[dat$Size.class == i,"Mass"]))
}

dat[dat$Size.class == "<30", "Mass"]

# more complex:
# define a new vector or data frame outside the for loop first
new_vector = c() # it's empty
# also define a counter
x = 1

for(i in levels(dat$Size.class)){
  new_vector[x] = mean(dat[dat$Size.class == i,"Mass"])
  x = x+1 # add 1 to the counter (this will change the element of new_vector we access each loop)
}
  
#check it
new_vector



# PUT THIS TOGETHER WITH THE LEVELS OF OUR FACTOR SO WE HAVE A NEW DATA FRAME:
# FIRST COLUMN WILL BE THE FACTOR LEVELS....
# SECOND COLUMN WILL BE NAMED "MEAN" AND WILL BE VALUES FROM  new_vector

#fill it in
size_class_mean_mass = data.frame(sizeClass = levels(dat$Size.class), Mean = new_vector)





############ YOUR HOMEWORK ASSIGNMENT ##############

# 1.  Make a scatterplot of headwidth vs mass. See if you can get the points to be colored by "Colony" they came from


# 2.  Write the code to save it (with meaningful labels) as a jpeg file


# 3.  Subset the thatch ant data set to only include ants from colony 1 and colony 2


# 4.  Write code to save this new subset as a .csv file


# 5.  Upload this R script (with all answers filled in and tasks completed) to canvas
      # I should be able to run your R script and get all the plots created and saved, etc. send in assignment three
