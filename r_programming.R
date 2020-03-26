############################# 5. R Nuts and Bolts ###################################

# 5.1 Entering input
#======================
  
x <- 1
print(x)
msg <- "hellow"

# 5.2 Evaluation
#=================
  
x <- 5          ## nothing printed
x               ## auto-printing occurs
print(x)        ## explicit printing
x <- 11:30
print(x)

# 5.6 Creating Vectors
#=======================

x <- c(0.5, 0.6)                 ## numeric
print(x)
x <- c(TRUE, FALSE)              ## logical
print(x)
x <- c(T, F)                     ## logical
print(x)
x <- c("a", "b", "c")            ## integer
print(x)
x <- c(1+0i, 2+4i)               ## complex
print(x)

x <- vector("numeric", length = 10)         ## Empty vector
print(x)

# 5.7 Mixing Objects
#========================

y <- c(1.7, "a")        ## character
print(y)
y <- c(TRUE, 2)         ## numeric
print(y)
y <- c("a", TRUE)       ## character
print(y)

# 5.8 Explicit Coercion
#=======================

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)


x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
as.complex(x)

# 5.9 Matrices
#=================

m <- matrix(nrow = 2, ncol = 3)
print(m)
dim(m)
attributes(m)

m <- matrix(1:6, nrow = 2, ncol = 3)
print(m)

m <- 1:10
print(m)
dim(m) <- c(2, 5)
print(m)

x <- 1:3
y <- 10:12
cbind(x, y)
rbind(x, y)

# 5.10 Lists
#==============

x <- list(1, "a", TRUE, 1+4i)
x

x <- vector("list", length = 5)     ## Creating empty list
x

# 5.11 Factors
#=================

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)
attr(x, "levels")

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
x <- factor(c("yes", "no", "yes", "no", "yes"), levels = c("yes", "no"))
x

# 5.12 Missing value
#====================

x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)

x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)

# 5.13 Data Frames
#===================

x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
x
nrow(x)
ncol(x)

# 5.14 Names
#=============

x <- 1:3
names(x)
names(x) <- c("New York", "Seattle", "Los Angeles")
x
names(x)

x <- list(Los_Angeles = 1, Boston = 2, London = 3)
x
names(x)

m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m


################################## 6. Getting Data In and Out of R #############################

initial <- read.csv("hotel-booking-demand/hotel_bookings.csv", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.csv("hotel-booking-demand/hotel_bookings.csv", colClasses = classes)


################################# 7. Using the readr Package ###############################

library(readr)
teams <- read_csv("hotel-booking-demand/hotel_bookings.csv")
teams

############################### 8. Using Textual and Binary Formats for Storing Data #################

## 8.1 Using dput() and dump()

y <- data.frame(a = 1, b = "a")
dput(y)

## Send 'dput' output to a file
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y

x <- "foo"
y <- data.frame(a = 1L, b = "a")

dump(c("x", "y"), file = "data.R")
rm(x, y)

## 8.2 Binary Formats

a <- data.frame(x = rnorm(10), y = runif(10))
b <- c(3, 4.4, 1/3)

save(a, b, file = "mydata.rda")
load("mydata.rda")

## Save everything to a file
save.image(file = "mydata.RData")
## load all objects in this file
load("mydata.RData")

################################ 10. Subsetting R Objects ##############################

## 10.1 Subsitting a Vector

x <- c("a", "b", "c", "d", "a")
x[1]
x[1:4]
x[c(1, 3, 4)]

u<- x >"a"
u
x[u]
x[x > "a"]

## 10.3 Subsetting Lists

x <- list(foo = 1:4, bar = 0.6)
x
x[[1]]
x[["bar"]]

x <- list(foo = 1:4, bar = 0.6, baz = "hellow")
name <- "foo"

x[[name]]
x$name
x$foo

## 10.2 Subsetting a Matrix

x <- matrix(1:6, 2, 3)
x

x[1,2]
x[2, 1]

x <- matrix(1:6, 2, 3)
x[1,2]
x[1, , drop = FALSE]

## 10.7 Removing NA Values

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
print(bad)
x[!bad]

y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]

head(airquality)
good <- complete.cases(airquality)
head(airquality[good, ])

#############################################################################################
####################### Week 1 Quiz Data Set ################################################
############################################################################################

data <- read.csv("quiz1_data/hw1_data.csv")
head(data, 2)
## Question - 18
#data1 <- data[(data$Ozone > 31) & (data$Temp > 90), ]
data1 <- subset(data, data$Ozone > 31 & data$Temp > 90)
mean(data1$Solar.R)

## Question - 19
data2 <- subset(data, data$Month == 6)
head(data2)
mean(data2$Temp)

## Question - 20
data3 <- subset(data, data$Month == 5)
max(data3$Ozone, na.rm = TRUE)













































