# MARpdfgstfrank
#--------------------------- MARgspdf
library(copula)
library(rgl)
M=10000 # number of Monte Carlo simulation
rho=.7 # single parameter in correlation matrix of the 3-dimensional Gaussian copula
d=2 # dimension of the Gaussian copula
norm.cop <- normalCopula(rho, dim = d, dispstr = "ex") 
U <- rCopula(M, norm.cop) 
u1=U[,1]
u2=U[,2]

ng=33 # number of grid
x=seq(0,1,length.out=ng)  # grid elements
y=seq(0,1,length.out=ng)

### function for usage in outer function
fhat=function(x,y){
u=cbind(x,y)
v=numeric()
v=dCopula(u, norm.cop , log=FALSE)
return(v)
}

### use outer function
outer931=outer(x,y,fhat)

### 3d PDF plot
open3d()
persp3d(x,y, outer931,
theta =35, phi = 35,
col="blue",
xlab = "u1", ylab = "u2", zlab = "c(u1, u2)",front="fill",back="line",alpha=0.9,
ticktype = "detailed",aspect=c(1,1,1.3))

box3d()# add a framework


### scatter plot and contour
plot(u1,u2, xlab="u1", ylab="u2", pch=19, cex=.1,col="white")
contour(outer931, drawlabels=T, nlevels=33, col=2, add=TRUE,cex=10)

### scatter plot and contour
plot(u1,u2, xlab="u1", ylab="u2", pch=19, cex=.1,col=1)

#--------------------------- MARtpdf
library(copula)
library(rgl)
M=10000 # number of Monte Carlo simulation
rho=.7 # single parameter in correlation matrix of the 3-dimensional Gaussian copula
d=2 # dimension of the Gaussian copula
dOfF=3 # degree of freedom
theta1Input=0.7 # parameter in t-copula

t.cop1 <- tCopula(theta1Input, dim = d, dispstr = "ex",df = 3, df.fixed = TRUE)
U <- rCopula(M, t.cop1 ) 
u1=U[,1]
u2=U[,2]

ng=33 # number of grid
x=seq(0,1,length.out=ng)  # grid elements
y=seq(0,1,length.out=ng)

### function for usage in outer function
fhat=function(x,y){
u=cbind(x,y)
v=numeric()
v=dCopula(u, t.cop1  , log=FALSE)
return(v)
}

### use outer function
outer931=outer(x,y,fhat)

### 3d PDF plot
open3d()
persp3d(x,y, outer931,
theta =35, phi = 35,
col="blue",
xlab = "u1", ylab = "u2", zlab = "c(u1, u2)",front="fill",back="line",alpha=0.9,
ticktype = "detailed",aspect=c(1,1,1.3))

box3d()# add a framework


### scatter plot and contour
plot(u1,u2, xlab="u1", ylab="u2", pch=19, cex=.1,col="white")
contour(outer931, drawlabels=T, nlevels=33, col=2, add=TRUE,cex=10)

### scatter plot and contour
plot(u1,u2, xlab="u1", ylab="u2", pch=19, cex=.1,col=1)

#--------------------------- MARfrankpdf
library(copula)
library(rgl)
M=10000 # number of Monte Carlo simulation
rho=.7 # single parameter in correlation matrix of the 3-dimensional Gaussian copula
d=2 # dimension of the Gaussian copula
theta2Input=0.7 # Kendall's tau

frank.cop <- frankCopula(iTau(frankCopula(), theta2Input), dim = d)
U <- rCopula(M, frank.cop ) 
u1=U[,1]
u2=U[,2]

ng=33 # number of grid
x=seq(0,1,length.out=ng)  # grid elements
y=seq(0,1,length.out=ng)

### function for usage in outer function
fhat=function(x,y){
u=cbind(x,y)
v=numeric()
v=dCopula(u, frank.cop , log=FALSE)
return(v)
}

### use outer function
outer931=outer(x,y,fhat)

### 3d PDF plot
open3d()
persp3d(x,y, outer931,
theta =35, phi = 35,
col="blue",
xlab = "u1", ylab = "u2", zlab = "c(u1, u2)",front="fill",back="line",alpha=0.9,
ticktype = "detailed",aspect=c(1,1,1.3))

box3d()# add a framework


### scatter plot and contour
plot(u1,u2, xlab="u1", ylab="u2", pch=19, cex=.1,col="white")
contour(outer931, drawlabels=T, nlevels=33, col=2, add=TRUE,cex=10)

### scatter plot and contour
plot(u1,u2, xlab="u1", ylab="u2", pch=19, cex=.1,col=1)

