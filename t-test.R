setwd('~/projects/stats_seandolinar_com/seandolinar_tutorials')

#creates distribution
x <- seq(-5,5,by=.01)
a1 <- dt(x,1)
a2 <- dt(x,2)
a3 <- dt(x,3)
a4 <- dt(x,4)
a5 <- dt(x,5)
a10 <- dt(x,10)
a15 <- dt(x,15)
a20 <- dt(x,20)
a30 <- dt(x,30)
a40 <- dt(x,40)
a50 <- dt(x,50)
n <- dnorm(x)

out.df <- cbind(x,a1,a2,a3,a4,a5,a10,a15,a20,a30,a40,a50,n)
write.csv(out.df, file='tdist.csv')

#reads data set
data <- read.csv('data/Height_data.csv')
height <- data$Height

#N - number in population
#n - number in sample
N <- length(height)
n <- 50

#population mean
pop_mean <- mean(height)

#tall-biased sample
cut <- 1:25000
weights <- cut^.6 * 0 + 1
sorted_height <- sort(height)
set.seed(123)
height_sample_biased <- sample(sorted_height, size=n, prob=weights)


sample_mean <- mean(height_sample_biased)
sample_sd <- sd(height_sample_biased)

#t-stat
t <- (sample_mean - pop_mean) / (sample_sd/sqrt(n))

#p-value for t-tes
pt(t,n-1)


pt(2.5706, 5)

