outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

best <- function(state, outcome){
        
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", 
                         na.strings = "Not Available")
        
        if (!state %in% data[, 7]) {
                stop("Please send a valid state.")
        }
        
        filtered_data <- data[, c(2, 7, 11, 17, 23)]
        
        colnames(filtered_data) <- c("hospital", "state", "heart attack",
                                     "heart failure", "pneumonia")
        
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        
        if (!outcome %in% outcomes){
                stop("Please send a valid outcomes")
        }
        
        filtered_data2 <- filtered_data[filtered_data$state == state & !is.na(filtered_data[outcome]),]
        
        filtered_data3 <- filtered_data2[, outcome]
        
        index_min <- which.min(filtered_data3)
        
        filtered_data2[index_min, ]$`hospital`
        
}


rankhospital <- function(state, outcome, num = "best") {
        
        ## Read outcome data
        
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", 
                         na.strings = "Not Available")
        
        ## Check that state and outcome are valid
        
        if (!state %in% data[, 7]) {
                stop("Please send a valid state.")
        }
        
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        
        if (!outcome %in% outcomes){
                stop("Please send a valid outcomes")
        }
        
        ## Return hospital name in that state with the given rank 30-day death rate
        
        filtered_data <- data[, c(2, 7, 11, 17, 23)]
        
        colnames(filtered_data) <- c("hospital", "state", "heart attack",
                                     "heart failure", "pneumonia")
        
        filtered_data2 <- filtered_data[filtered_data$state == state & !is.na(filtered_data[outcome]),]
        
        ordered_data <- filtered_data2[order(as.numeric(filtered_data2[[outcome]])), ]
        
        ordered_data2 <- ordered_data[, c("hospital", outcome)]
        
        ordered_data3 <- cbind(ordered_data2, rank = 1:nrow(ordered_data2))
        
        colnames(ordered_data3) <- c("hospital", "rate", "rank")
        
        if (num == "best")
                return(ordered_data3[1, ]$hospital)
        
        else if (num == 'worst')
                return(ordered_data3[nrow(ordered_data3), ]$hospital)
        
        else if (as.numeric(num) > nrow(ordered_data3))
                return(NA)
        
        else
                return(ordered_data3[as.numeric(num), ]$hospital)
    
        
        
}

rankall <- function(outcome, num = "best") {
        
        ## Read outcome data
        
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", 
                         na.strings = "Not Available")
        
        ## Check that outcome are valid
        
        outcomes <- c("heart attack", "heart failure", "pneumonia")
        
        if (!outcome %in% outcomes){
                stop("Please send a valid outcomes")
        }
        
        all_state <- unique(data$State)
        
        rank_in_state <- vector(mode = "numeric")
        st <- vector(mode = "numeric")
        
        for (i in all_state) {
                
                st <- c(st, i)
                rank_in_state <- c(rank_in_state, rankhospital(i, outcome, num))
        }
        
        final <- data.frame(hospital = rank_in_state, state = st)
        final
        
}

    



















































