# Counting customer each year
transaction %>% 
  group_by(yrs = year(Date),distinct_cust = CustomerID) %>% 
  summarise(n = n()) %>% 
  group_by(yrs) %>% 
  summarise(cust = n())

# Counting loss customer
i <- 1
while (i <= length(year)) {
  print(lostcustomeryoy((year[i]-1),year[i]))
  i <- i + 1
}

# Counting new customer
i <- 1
while (i <= length(year)) {
  print(lostcustomeryoy(year[i],(year[i]-1)))
  i <- i + 1
}

# Counting discount ratio
ration <- transaction %>% 
  mutate(year=year(Date)) %>% 
  group_by(year) %>% 
  summarise(trans_value = sum(TotalSales),discount_value = sum(Discount)) %>% 
  mutate(ratio=discount_value/trans_value)

# Manually making vector and data frame 
year <- c("2019", "2020", "2021", "2022", "2023")
years <- c(2019:2023)
customer_count <- c(283, 245, 220, 260, 169)
customer_loss <- c(0, -99, -89, -61, -121)
customer_new <- c(0, 61, 64, 101, 30)
disc_ration <- c(0.177,0.167,0.179,0.179,0.180)

# Making Data Frame
growth_df <- data.frame(
  yr = year,
  yrs = years,
  customer = customer_count,
  loss_customer = customer_loss,
  new_customer = customer_new,
  discount_ratio = disc_ration
)


# Bar Chart : Count/Distinct Customer Each Year
growth_df %>% ggplot(growth_df, mapping = aes(x = yrs)) + 
  geom_col(mapping = aes(y = customer, fill = "gold"), show.legend = FALSE) +
  geom_line(mapping = aes(y = discount_ratio*1500)) +
  scale_y_continuous(name = "Count Customer", sec.axis =  sec_axis(trans = ~.*(1/1500), name = "Discount Ratio")) +
  theme_light() +
  labs(x='Year', y='Count Customer', title = 'Customer Each Year', subtitle = 'Added "Discount Ratio" to compare')

  
growth_df %>% 
  select(yr,new_customer) %>% 
  waterfall(growth_df, calc_total = TRUE, total_rect_color = "blue") + 
  labs(title = 'New Customer')

growth_df %>% 
  select(yr,loss_customer) %>% 
  waterfall(growth_df, calc_total = TRUE, total_rect_color = "red") +
  labs(title = 'Loss Customer')

