############################# R Nuts and Bolts ###################################

# 5.1 Entering input
x <- 1
print(x)
msg <- "hellow"

# 5.2 Evaluation
x <- 5          ## nothing printed
x               ## auto-printing occurs
print(x)        ## explicit printing
x <- 11:30
print(x)

# 5.6 Creating Vectors
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
y <- c(1.7, "a")
y <- c(TRUE, 2)

























