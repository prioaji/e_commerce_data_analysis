maketable <- function(year1 = 2019){
transaction %>% 
  filter(year(Date) == year1) %>% 
  select(CustomerID) %>% 
  distinct(CustomerID) %>% 
  mutate(counts = 1)
}

maketable(2020)
