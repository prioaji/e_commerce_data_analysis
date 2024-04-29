cust_retention %>% 
  filter(number_of_trans <= 150) %>% 
  ggplot(cust_retention, mapping = aes(x=number_of_trans, fill= year)) + geom_density()+facet_wrap(vars(year),ncol = 2)