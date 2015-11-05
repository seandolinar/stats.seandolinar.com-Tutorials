#install.packages('dplyr')
library(dplyr) #load the package

#set your working directory
setwd('/Users/seandolinar/seandolinar_com/stats.seandolinar.com-Tutorials/data')

#from http://www.fangraphs.com/leaders.aspx?pos=all&stats=bat&lg=all&qual=y&type=8&season=2015&month=0&season1=2010&ind=1&team=&rost=&age=&filter=&players=&page=2_30
data <- read.csv('FanGraphs Leaderboard.csv')



##############
####dplyr#####
##############

#finds all players who played for the Marlins
data.sub.1 <- filter(data, Team=='Marlins')

#finds all the NL East players
NL.East <- c('Marlins','Nationals','Mets','Braves','Phillies') #makes the division
data.sub.2 <- filter(data, Team %in% NL.East) #finds all players that are in the NL East

#Both of these find players in the NL East and have more than 30 home runs.
data.sub.3 <- filter(data, Team %in% NL.East, HR > 30) #uses multiple arguments
data.sub.3 <- filter(data, Team %in% NL.East & HR > 30) #uses & sign

#Finds players in the NL East or has more than 30 HR
data.sub.4 <- filter(data, Team %in% NL.East | HR > 30)

#Finds players not in the NL East and who have more than 30 home runs.
data.sub.5 <- filter(data, !(Team %in% NL.East), HR > 30)





################################
####Using Built-in Functions####
###############################


#method 1 -- using a T/F vector
data.sub.1 <- data[data$Team == 'Marlins',]

#method 2 -- which()
data.sub.2 <- data[which(data$Team == 'Marlins'),]

#method 3 -- subset()
data.sub.3 <- subset(data,subset = (Team=='Marlins'))

#other functions
data.sub.4 <- data[data$HR > 30,] #greater than
data.sub.5 <- data[data$HR < 30,] #less than

data.sub.6 <- data[data$AVG > .320 & data$PA > 600,] #duel requirements using AND (&)
data.sub.7 <- data.sub3 <- subset(data, subset = (AVG > .300 & PA > 600)) #using subset()

data.sub.8 <- data[data$HR > 40 | data$SB > 30,] #duel requirements using OR (|)

data.sub.9 <- data[data$Team %in% c('Marlins','Nationals','Mets','Braves','Phillies'),] #finds values in a vector

data.sub.10 <- data[data$Team != '- - -',] #removes players who played for two teams


