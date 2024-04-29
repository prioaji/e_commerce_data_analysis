loyality <- {
  distinct(transaction %>%
  group_by(CustomerID, year = year(Date)) %>%
  summarise(transaction_value = sum(TotalSales)) %>% 
  group_by(CustomerID) %>% 
  summarise(loyality = n(), average_value = ave(transaction_value)))
}
summarize_cust <- {total_sale <- transaction %>% 
  group_by(CustomerID) %>%
  summarise(transaction_value = sum(TotalSales))
left_join(loyality,total_sale)
}


loyality %>%
  ggplot(loyality, mapping = aes(x = loyality, y = average_value, fill = loyality), show.legend = FALSE) + 
  geom_boxplot(mapping = aes(group = loyality)) + 
  scale_y_continuous(limits = c(0, 650000)) +
  labs(x='Loyality', y='Average Transaction ($)', title = 'Customer Average Transaction ($)', subtitle = 'Loyality means how many years they use platform')


loyality %>% 
  group_by(loyality) %>% 
  summarise(count_cust = n()) %>% 
  ggplot(loyality, mapping = aes(x = loyality, y = count_cust, fill = loyality)) + 
  geom_col() +
  labs(x ='Loyality', y ='Customer (n)', title = 'Number of Customer :', subtitle = 'based on how many years they use platform')

summarize_cust %>% 
  group_by(loyality) %>% 
  summarise(total = sum(transaction_value)) %>% 
  mutate(percent = total/sum(total)) %>% 
  ggplot(summarize_cust, mapping = aes(x = "", y = percent, fill = loyality)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  labs(x = NULL , y ='Sales Value ($)', title = 'Total Transaction ($)')

