# Question 1

#1.1

library(dplyr)
average_mpg <- summarize(group_by(mtcars, cyl), avg_mpg = mean(mpg))
print(average_mpg)

#1.2

lm_model <- lm(mpg ~ cyl + wt,data = mtcars)
new_data <- data.frame(cyl = 6, wt= 3000/1000)
mpg_pred <- predict(lm_model, new_data)
print(mpg_pred)

#1.3

ggplot(mtcars, aes(x = wt, y = mpg))+
  geom_point()+
  geom_smooth(method = "lm")

# Question 2

#2.1

plot(BJsales, main = "BJ Sales", ylab = "sales", xlab = "months")

#2.2

bj_ts <- data.frame(sales = BJsales, time = time(BJsales))
lm_model_bj_sales <- lm(sales ~ time, data = bj_ts)
pred_period <- data.frame(time = c(151:160))
sales_pred <- predict(lm_model_bj_sales, pred_period)
print(sales_pred)



