################################# 14. Control Structure ############################

## 14.1 if-else

x <- runif(1, 0, 10) ## Generate a uniform random number

if(x > 3){
        y <- 10
} else {
        y <- 0
}

## 14.2 for loops

for(i in 1:10){
        print(i)
}

x <- c("a", "b", "c", "d")
for (i in 1:4) {
        print(x[i])
}

for (i in seq_along(x)) {
        print(x[i])
}

for(letter in x){
        print(letter)
}

for (i in 1:4) print(x[i])

## 14.3 Nested for loops

x <- matrix(1:6, 2, 3)

for( i in seq_len(nrow(x))){
        for(j in seq_len(ncol(x))){
                print(x[i, j])
        }
}

## 14.4 while loops

count <- 0
while (count < 10) {
        print(count)
        count <- count + 1
}

z <- 5
set.seed(1)

while(z >= 3 && z <= 10){
        coin <- rbinom(1, 1, 0.5)  ## Binomial Distribution
        
        if(coin == 1){
                z <- z+1
                print(z)
        }else{
                z <- z - 1
                print(z)
        }
        
}

###########################  15. Functions  ############################

add2 <- function(x, y){
        x + y
}

above10 <- function(x){
        use <- x > 10
        x[use]
}

above <- function(x, n = 10){
        use <- x > n
        x[use]
}

col_mean <- function(y, removeNA = TRUE){
        nc <- ncol(y)
        means <- numeric(nc)
        for (i in seq_len(nc)) {
                means[i] <- mean(y[, i], na.rm = removeNA)
        }
        means
}

f <- function(num){
        hello <- "Hello, world!\n"
        for(i in seq_len(num)){
                cat(hello)
        }
        chars <- nchar(hello)* num
        chars
}

y <- 10

f<- function(x){
        y <- 2
        y^2 + g(x)
        print(y)
}

g <- function(x){
        x*y
        print(y)
}


########################## Programming Assignment #############################
# 
# pollutantmean <- function(directory, pollutant, id = 1:332) {
# 
#         dirs <- list.dirs()
#         directory <- (dirs[grepl(directory, dirs)])
#         
#         # Create extra variables
#         file_list <- list.files(directory)
#         data <- NA
#         
#         # Read csv-files and combine them into dataframe called data
#         for (i in id) {
#                 file_path <- paste(directory, file_list[i], sep="/")
#                 csv_data <- read.csv(file_path)
#                 data <- rbind(data, csv_data)
#         }
#         
#         # Final step, calculate mean depending on pollutant
#         mean(data[[pollutant]], na.rm = TRUE)
# }


pollutantmean <- function(directory, pollutant, id = 1:332){
        
        file_list <- list.files(directory)
        data <- NA
        
        for (i in id) {
                file_path <- paste(directory, file_list[i], sep = "/")
                csv_data <- read.csv(file_path)
                data <- rbind(data, csv_data)
        }
        mean(data[[pollutant]], na.rm = TRUE)
}


complete <- function(directory, id = 1:332){
        
        filt_list <- list.files(directory)
        ids <- vector()
        njobs <- vector()
        
        
        for (i in id) {
                file_path <- paste(directory, filt_list[i], sep = "/")
                csv_data <- read.csv(file_path)
                com_cases <- sum(complete.cases(csv_data))
                ids <- c(ids,i)
                njobs <- c(njobs, com_cases)
                
                
        }
        complete <-data.frame(ids = ids, njobs = njobs)
        complete
     
}

# a <- vector()
# b <- vector()
# 
# for (i in 1:10) {
#         a <- c(a, 2*i)
#         b <- c(b, 3*i)
# }


corr <- function(directory, threshold = 0){
        file_list <- list.files(directory)
        observations <- complete(directory)
        filtered <- subset(observations, observations$njobs > threshold)
        correlation <- vector()
        
        for (i in filtered$ids) {
                file_path <- paste(directory, file_list[i], sep = "/")
                csv_data <- read.csv(file_path)
                ## https://stackoverflow.com/questions/4862178/remove-rows-with-all-or-some-nas-missing-values-in-data-frame
                csv_data <- csv_data[complete.cases(csv_data), ]
                correlation <- c(correlation, cor(csv_data$nitrate, csv_data$sulfate))
        }
        correlation
}





























        







