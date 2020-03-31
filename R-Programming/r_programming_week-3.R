############################# 18. Loop Functions ######################

## lapply()

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

x <- 1:4
lapply(x, runif)

x <- 1:4
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
lapply(x, function(elt){ elt[, 1]})

f <- function(elt){
        elt[, 1]
}

lapply(x, f)


## sapply()

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
sapply(x, mean)

## apply()

x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)  ## column
apply(x, 1, mean)  ## row

colMeans(x)
colSums(x)
rowMeans(x)
rowSums(x)
        
x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)   ## Faster

## mapply 

mapply(rep, 1:4, 4:1)

noise <- function(n, mean, sd){
        rnorm(n, mean, sd)
}

noise(5, 1, 2)
noise(1:5, 1:5, 2)  ## This only simulates 1 set of numbers, not 5

mapply(noise, 1:5, 1:5, 2)

## tapply()

x <- c(rnorm(10), runif(10), rnorm(10, 1))
index <- gl(3, 10)
index
tapply(x, index, mean)
tapply(x, index, range)

## split

x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

lapply(split(x, f), mean)

## Splitting a Data Frame

library(datasets)
head(airquality)

s <- split(airquality, airquality$Month)
str(s)

lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))  ## More readable output


######### Week : 3 Quiz ############

library(datasets)
data(iris)

head(iris)

tapply(iris$Sepal.Length, iris$Species, mean)

library(datasets)
data("mtcars")
?mtcars

tapply(mtcars$mpg, mtcars$cyl, mean)
head(mtcars)

demo <- tapply(mtcars$hp, mtcars$cyl, mean)









