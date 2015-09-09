install.packages("ggplot2")
install.packages('gridExtra')
library(ggplot2)
library(grid)
library(gridExtra)

#covariance vs correlation
a <- c(1,2,3,4,5,5,6,7,10,4,8)
b <- c(4,5,6,8,8,4,10,12,15,9,12)
c <- c(4,5,6,8,8,4,10,12,15,9,12) * 10

data <- data.frame(a, b, c)

cov(a, b)  #8.5
cov(a, c)  #85

cor(a,b)  #0.8954
cor(a,c)  #0.8954

ggplot(data, aes(x=a, y=b)) + geom_point(size=circle.size, pch=21, fill=colors[[2]]) +
  ggtitle('b vs a')

ggplot(data, aes(x=a, y=c)) + geom_point(size=circle.size, pch=21, fill=colors[[2]]) +
  ggtitle('c vs a')

####basic correlation
x <- anscombe$x1
y <- anscombe$y1

#easy
cor(x,y)

#using the definition
cov(x,y)/(sd(x)*sd(y))

#correlation
cor1 <- format(cor(anscombe$x1, anscombe$y1), digits=4)
cor2 <- format(cor(anscombe$x2, anscombe$y2), digits=4)
cor3 <- format(cor(anscombe$x3, anscombe$y3), digits=4)
cor4 <- format(cor(anscombe$x4, anscombe$y4), digits=4)


#define the OLS regression
line1 <- lm(y1 ~ x1, data=anscombe)
line2 <- lm(y2 ~ x2, data=anscombe)
line3 <- lm(y3 ~ x3, data=anscombe)
line4 <- lm(y4 ~ x4, data=anscombe)




circle.size = 5
colors = list('red', '#0066CC', '#4BB14B', '#FCE638')

#plot1
plot1 <- ggplot(anscombe, aes(x=x1, y=y1)) + geom_point(size=circle.size, pch=21, fill=colors[[1]]) +
  geom_abline(intercept=line1$coefficients[1], slope=line1$coefficients[2]) +
  annotate("text", x = 12, y = 5, label = paste("correlation = ", cor1))

#plot2
plot2 <- ggplot(anscombe, aes(x=x2, y=y2)) + geom_point(size=circle.size, pch=21, fill=colors[[2]]) +
  geom_abline(intercept=line2$coefficients[1], slope=line2$coefficients[2]) +
  annotate("text", x = 12, y = 3, label = paste("correlation = ", cor2))


#plot3
plot3 <- ggplot(anscombe, aes(x=x3, y=y3)) + geom_point(size=circle.size, pch=21, fill=colors[[3]]) +
  geom_abline(intercept=line3$coefficients[1], slope=line3$coefficients[2]) +
  annotate("text", x = 12, y = 6, label = paste("correlation = ", cor3))



#plot4
plot4 <- ggplot(anscombe, aes(x=x4, y=y4)) + geom_point(size=circle.size, pch=21, fill=colors[[4]]) +
  geom_abline(intercept=line4$coefficients[1], slope=line4$coefficients[2]) +
  annotate("text", x = 15, y = 6, label = paste("correlation = ", cor4))


grid.arrange(plot1, plot2, plot3, plot4, top='Anscombe Quadrant -- Correlation Demostration')
