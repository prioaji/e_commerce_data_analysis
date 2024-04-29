transaction %>% 
  group_by(Date) %>% 
  summarise(daily_discount = sum(Discount)) %>% 
  ggplot(transaction, mapping = aes(x=Date, y=daily_discount)) + geom_line(color="green") + geom_smooth(color="blue")