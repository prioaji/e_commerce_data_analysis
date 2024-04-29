cust_retention %>%
  ggplot(cust_retention, mapping=aes(x=year,y=number_of_trans)) + geom_col(fill = "darkgreen")+ 
  labs(x='Year',y='Yearly Transaction',title = 'Number of Transaction per Year')