transaction %>% 
  mutate(year=year(Date)) %>% 
  group_by(year) %>% 
  summarise(trans_value=sum(TotalSales),discount_value=sum(Discount)) %>% 
  mutate(ratio=discount_value/trans_value) -> ratio_ 
ratio_%>% 
  ggplot(transaction, mapping=aes(x=year,y=ratio)) + geom_line(color="purple") + geom_point(color="purple") + labs(x='Year',y='Ratio',title = 'Ratio : Discount vs Value')