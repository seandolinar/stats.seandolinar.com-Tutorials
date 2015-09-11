library(ggplot2)
library(grid)

#get a data set
X <- c(anscombe$x1, 6,4,10)
Y <- c(anscombe$y1, 10,8,6)

#build the data frame
data <- data.frame(X,Y)

#get the means
X.bar <- mean(X)
Y.bar <- mean(Y)

#sign function the rectangle
data$S <- factor(sign((X-X.bar)*(Y-Y.bar)))

#calculate the covariance
sum((X-X.bar)*(Y-Y.bar)) / (length(X)) #manually population
sum((X-X.bar)*(Y-Y.bar)) / (length(X) - 1) #manually sample

cov(X,Y) #built-in function USES SAMPLE COVARIANCE


mean(X*Y) - mean(X)*mean(Y) #expected value notation

#########
##PLOTS##
#########

#set ggplot parameters
circle.size = 5
colors = list('red', '#0066CC', '#4BB14B', '#FCE638')

SD_Theme = theme(text = element_text(family='Avenir'),
                 legend.position="none",
                 axis.line = element_line(color='#BFBFBF', size=.5),
                 panel.grid.major = element_line(color='#BFBFBF', size=.25),
                 plot.margin = unit(c(2,2,2,2), "cm"),
                 axis.title = element_text(family='Avenir', face='bold', hjust=.5, vjust=.5, size=12),
                 axis.text = element_text(family='Avenir', color='black'),
                 title = element_text(family='Avenir', face='bold', hjust=.5, vjust=1, lineheight=3150, size=16))

#scatterplot
ggplot(data, aes(X,Y)) +
  scale_fill_manual(values=c('red','#FCE638')) +
  geom_point(size=circle.size, pch=21, fill=colors[[2]]) +
  geom_hline(yintercept=Y.bar, linetype='longdash') +
  geom_vline(xintercept=X.bar, linetype='longdash') +
  geom_text(x=6, y=Y.bar + .1 , label="bar(X)", family='Avenir', parse=T) +
  geom_text(x=X.bar + .2, y=6 , label="bar(Y)", family='Avenir', parse=T) +
  ggtitle('Y vs. X Scatterplot') +
  xlim(4, 16) +
  SD_Theme


#one rectangle
i=6
ggplot(data, aes(X,Y)) +
  
  geom_rect(xmin=X.bar, xmax=X[6], ymin=Y.bar, ymax=Y[6], alpha=.05, aes(fill=S)) +   
  scale_fill_manual(values=c('red','#FCE638')) +
  geom_point(size=circle.size, pch=21, fill=colors[[2]]) +
  geom_hline(yintercept=Y.bar, linetype='longdash') +
  geom_vline(xintercept=X.bar, linetype='longdash') +
  ggtitle('Y vs. X Scatterplot With Covariance Rectangle') +
  geom_text(x=6, y=Y.bar + .1 , label="bar(X)", family='Avenir', parse=T) +
  geom_text(x=X.bar + .2, y=6 , label="bar(Y)", family='Avenir', parse=T) +
  geom_text(x=(X[i]-X.bar)*.5+X.bar, y=Y[i]+.1 , label="X[i] - bar(X)", family='Avenir', parse=T) +
  geom_text(x=X[i]+.5, y=(Y[i]-Y.bar)*.5+Y.bar , label="Y[i] - bar(Y)", family='Avenir', parse=T) +
  geom_text(x=X[i]+.6, y=Y[i] + .2 , label="(list(X[i], Y[i]))", family='Avenir', parse=T) +
  xlim(4, 16) +
  SD_Theme




#all of the rectangles
ggplot(data, aes(X,Y, xmin=X.bar, xmax=X, ymin=Y.bar, ymax=Y)) + geom_point(size=circle.size, pch=21, fill=colors[[2]]) +
  geom_hline(yintercept=Y.bar, linetype='longdash') +
  geom_vline(xintercept=X.bar, linetype='longdash') +
  geom_rect(alpha=.2, aes(fill=S)) +   scale_fill_manual(values=c('red','#0066CC')) +
  ggtitle('All Covariance Rectangles') +
  geom_text(x=12, y=9.5 , label="+", family='Avenir', size = 28) +
  geom_text(x=6, y=9.5 , label="-", family='Avenir', size = 36) +
  geom_text(x=12, y=6 , label="-", family='Avenir', size = 36) +
  geom_text(x=6, y=6 , label="+", family='Avenir', size = 28) +
  SD_Theme







