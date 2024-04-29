transaction %>% 
  group_by(Date) %>% 
  summarise(n_of_trans=sum(count_trans)) -> transaction_2

transaction_2 %>% 
  ggplot(transaction_2, mapping=aes(x=Date,y=n_of_trans)) + geom_smooth(color="darkgreen") + 
  labs(x='Year',y='Daily Transaction',title = 'The Trends of Daily Transaction (n)')
