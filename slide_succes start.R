transaction %>% 
  filter(year(Date) <= 2020) %>% 
  summarise(sum(count_trans),sum(TotalSales))

transaction %>% 
  filter(year(Date) == 2019) %>% 
  summarise(sum(TotalSales)) ->x

transaction %>% 
  filter(year(Date) == 2020) %>% 
  summarise(sum(TotalSales)) ->y

(y-x)/x
