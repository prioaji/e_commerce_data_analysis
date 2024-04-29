transaction <- 
  file_out2 %>% 
  select_all() %>% 
  mutate(discount_percent = if_else(Discount>0,Discount/TotalSales,0)) %>% 
  mutate(count_trans = 1)

transaction
