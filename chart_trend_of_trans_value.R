transaction %>% 
  group_by(Date) %>% 
  summarise(trans_value=sum(TotalSales),discount_value=sum(Discount)) -> trans
  pivot_longer(trans,trans_value:discount_value, names_to = "value_type",values_to = "value") -> transaction_3

transaction_3 %>% 
  ggplot(transaction_3, mapping=aes(x=Date,y=value,color = value_type)) + 
  geom_smooth() + 
  labs(x='Year',y='Daily Transaction Value',title = 'The Trends of Transaction Value')
