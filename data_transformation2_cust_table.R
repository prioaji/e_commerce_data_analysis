cust_retention <- 
transaction %>% 
  mutate(year = str_sub(Date,1,4)) %>% 
  mutate(count = 1) %>% 
  relocate(year,.after = CustomerID) %>% 
  unite(cust_year,CustomerID:year,sep = "-") %>% 
  group_by(cust_year) %>% 
  summarise(discount_value=sum(Discount),trans_value=sum(TotalSales),number_of_trans=sum(count), avg_disc = mean(discount_percent, na.rm = TRUE)) %>% 
  separate(cust_year, into = c("customer_id","year"),sep = "-")