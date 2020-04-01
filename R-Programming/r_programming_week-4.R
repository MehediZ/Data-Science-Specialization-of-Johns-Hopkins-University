############################# 20. Debugging ############################

## 20.1 Something's Wrong

log(-1)

printmessage <- function(x){
        if(x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}

printmessage(1)
printmessage(NA)

printmessage2 <- function(x){
        if(is.na(x))
                print("x is a missing value")
        else if(x >0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}
printmessage2(NA)

x <- log(c(-1, 2))
printmessage2(x)

## 20.4 Using traceback()

mean(y)
traceback()

lm(y ~ x)
traceback()


## 20.5 Using debug()

debug(lm)
lm(y ~ x)

## 20.6 Using recover()

options(error = recover)
read.csv(("nosuchfile"))

################### 22. Simulation ######################

x <- rnorm(10)
x
summary(x)

x <- rnorm(10, 20, 2)
x
summary(x)
pnorm(2) ## probability of x is less than 2

## 22.2 Setting the random number seed

set.seed(1)
rnorm(5)

rpois(10, 1)  ## Counts with a mean of 1
rpois(10, 2)   ## Counts with a mean of 2
rpois(10, 20)  ## Counts with a mean of 20

##  22.3 Simulating a Linear Model

set.seed(20)
x <- rnorm(100)

e <- rnorm(100, 0, 2) ## error term
y <- 0.5 + 2*x + e
summary(y)
plot(x, y)

## 22.4 Random Sampling

set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10)
sample(1:10, replace = TRUE)

library(datasets)
data("airquality")
head(airquality)

set.seed(20)
idx <- seq_len(nrow(airquality))
samp <- sample(idx, 6)
airquality[samp, ]


################## 21. Profiling R Code ##################

system.time(readLines("http://www.jhsph.edu"))

hilbert <- function(n) {
        i <- 1:n
        1 / outer(i - 1, i, "+")
        }
x <- hilbert(1000)
system.time(svd(x))

system.time({
        n <- 1000
        r <- numeric(n)
        for (i in 1:n) {
                x <- rnorm(n)
                r[i] <- mean(x)
        }
})

Rprof()
Rprof(NULL)
sample.interval = 10000




































