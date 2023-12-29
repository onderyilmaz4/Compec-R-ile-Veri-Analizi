# Exercise 1 

days <- c("Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", "Monday")

days_repeated <- rep(days, 9000)
days_repeated[9]
days_repeated[54]
days_repeated[306]
days_repeated[8999]

# Exercise 2

numbers <- 1:100
numbers_div3 <- numbers[numbers %% 3 == 0]
numbers_div5 <- numbers[numbers %% 5 == 0]
numbers_div15 <- numbers[numbers %% 15 == 0]
  
sum_numbers = sum(numbers_div3) + sum(numbers_div5) - sum(numbers_div15)
print(sum_numbers)

# Exercise 3

measurement_days <- seq(5,365,5)
print(measurement_days)

# Question 1

vector_norm <- rnorm(50,20,2)
sample(vector_norm, 10)

# Question 2

#3.1
install.packages("LearnBayes")
library(LearnBayes)

stu_data <- studentdata
stu_data_no_na <- na.omit(stu_data)

#3.2

gen <- stu_data$Gender
number_female = length(gen[gen == "female"])
print(number_female)

#3.3

height <- stu_data$Height
height_cm <- height * 2.54

number_tall = length((height_cm[height_cm> 180]))
print(number_tall)

#3.4

plot(gen, height)
