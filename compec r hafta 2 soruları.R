# Question 1

library(gapminder)
data <- gapminder
years <- data$year
unique(years)

# Question 2

library(magrittr)
data %>% 
  filter(year == 1962|year == 2002) %>% group_by(year) %>% summarise(mean(lifeExp), median(lifeExp))

# Question 3 (answer taken from notes)

library(ggrepel)
data %>% 
  filter(year == 1962 | year == 1982 | year == 2002) %>% 
  filter(continent == "Europe") %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp, label = country)) +
  geom_text_repel(color="red") +
  facet_wrap(~year) +
  labs(x = "GDP per capita", y = "Life expectancy", title = "Life expectancy vs. GDP per capita") +
  scale_x_continuous(labels = scales::comma) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

# Question 4 (answer taken from notes)

# Your answer:
data %>% 
  filter(country == "Turkey") %>% 
  ggplot(aes(x = year, y = pop)) +
  geom_line() +
  labs(x = "Year", y = "Population", title = "Population growth in Turkey") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  # no scientific notation
  scale_y_continuous(labels = scales::comma)