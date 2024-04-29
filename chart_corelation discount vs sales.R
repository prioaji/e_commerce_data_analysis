cust_retention %>% 
  ggplot(mapping = aes(x = avg_disc*100, y = number_of_trans, color = "pink"), show) +
  geom_point() +
  xlim(c(0, 20)) + 
  ylim(c(0, 500)) +
  labs(x ='Discount (%)', y ='Retention', title = 'Correlation between Discount & Customer Retention')
