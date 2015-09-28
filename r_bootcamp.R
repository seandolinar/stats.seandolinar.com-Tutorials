#comments start with #-signs

9-3 #basic math (this doesn't save this in a variable)

x <- 5 #assigns the value 1 into the variable x
x <- 9-3 #assigns the results of the right side to the variable x
x = 1 #also works, but a lot of R still uses <-

#R is very case sensitive
A <- 5
a <- 3

A == a #this returns FALSE



#basic operations
#yields numeric value
1+2 #addition
3-2 #subtraction
3*2 #multiplication
4/5 #division
3 %% 2 #modulus (remainder operator)

#yields boolean (T/F)
4 > 9
10 < 2
9 == 3 #note double equal sign
5 >= 3
4 <= 1

#basic data structure

NULL     #empty value
NA       #missing value
9100     #numeric value
'abcdef' #string
TRUE     #boolean
T        #equilvant form
FALSE 
F

#logical operators
T && F #and
F || T #or

#NULL vs NA
c(NULL, 1, 3) #yields a vector of [1,3]
c(NA, 1, 3) #yields a vector of [NA, 1, 3]

list(NULL, 2, 3) #yields a list with a NULL object in the first element
list(NA, 2, 3) #yields a list with an object with the value NA in the first element


x <- 1 #basic assignment
x = 1

#####Acceptable Variables
x <- 1
X <- 1
X1 <- 1
X.1 <- 1
X_1 <- 1
########################

####UNACCEPTABLE Variables
1X <- 1
X-1 <- 1  #CODE WILL NOT WORK
X,1 <- 1
#######################

#R is very case sensitive
A <- 5
a <- 3

A == a #this returns FALSE



x.vector <- c() #vector operator
x.vector <- c(1,2,3,4,5,6) #creates a vector (typically numeric)
x.vector <- c(T, 1)
x.list <- list('A',12,'b') #creates a list (not used for numeric operations)

mean(c(1,3,2))

x.list <- list(1,3,x.vector)
mean(x.list[[3]]) 


x.vector <- c(10,11,12,12,10,11,20,9) #puts your data into a vector
x.vector[1] #accesses first element in vector
x.vector[2:4] #accesses elements 2 through 4.

#basic stats
x.vector <- c(10,11,12,12,10,11,20,9) #puts your data into a vector

mean(x.vector) #takes mean of vector
median(x.vector) #median of vector
max(x.vector) #maximum of vector
min(x.vector) #minimum of vector
range(x.vector) #yields a vector with a range

sd(x.vector) #standard deviation
var(x.vector) #variance

#load in data
setwd('**file path**') #sets your working directory 
                                         #specific to each computer

read.csv('data_bryant_kobe.csv') #reads the data into R
                                 #does not save it into a variable

data <- read.csv('data_bryant_kobe.csv') #reads the data and saves it
                                         #into a variable called 'data'

#data is a data frame, which is a collection of columns/vectors

#accessing values
row <- 3
column <- 2
data$Age #returns the Age variable column
data[row,column]  #individual value
data[data$Age <= 25,]        #returns entire row
data[,column]     #returns entire column as a vector
data$Age[3]       #returns entire column as a vector

#Basic Data Processing

#creating a quick subset
data.U25 <- data[data$Age < 25,]  #creates an under-25 set
data.O25 <- data[data$Age >= 25,] #creates a 25 and older set

#correlation between different variables within the subset
cor(data.U25$MP, data.U25$PTS)
cor(data.O25$MP, data.O25$PTS)

cor(data$MP, data$PTS) #correlation with two related vectors from data set
cor(data$MP, data$FTpct) #weak correlation

#create a basic linear model
linear.model <- lm(PTS ~ MP, data=data.U25)
linear.model <- lm(PTS ~ MP + Age, data=data.U25)

#coefficients and summary of regression
summary(linear.model)







