#create vectors -- these will be our columns
a <- c(1,2,3,4,5,6)
b <- c(2,3,5,6,1,9)
c <- c(3,5,5,5,10,8)
d <- c(10,20,30,40,50,55)
e <- c(7,8,9,4,6,10)


#create matrix from vectors
M <- cbind(a,b,c,d,e)
k <- ncol(M) #number of variables
n <- nrow(M) #number of subjects

#create means for each column
M_mean <- matrix(data=1, nrow=n) %*% cbind(mean(a),mean(b),mean(c),mean(d),mean(e)) 

#creates a difference matrix
D <- M - M_mean

#creates the covariance matrix
C <- (n-1)^-1 * t(D) %*% D #sample covariance [matches cov()]
C <- (n)^-1 * t(D) %*% D #population covariance



#pulls out the variances from the covariance matrix
var_vector <- diag(C)^(-1/2)

#constructs the correlation matrix
diag(var_vector) %*% C %*% diag(var_vector)

#uses R's built-in functions
cov(M)
cor(M)
