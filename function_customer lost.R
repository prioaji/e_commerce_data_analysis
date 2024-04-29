lostcustomeryoy <- function(year_1 = 2019, year_2 = 2020){
  
  period1 <- maketable(year_1) %>% 
    select(CustomerID)
  
  period2 <- maketable(year_2) %>% 
    select(CustomerID)
  
  idxt1 <- 1
  
  idxt2 <- 1
  
  length1 <- maketable(year_1) %>% 
    select_all() %>%
    summarise(sum(counts))
  
  length2 <- maketable(year_2) %>% 
    select_all() %>% 
    summarise(sum(counts))
  
  lost <- 0
  
  while(idxt1 <= length1){
    while(idxt2 <= length2){
      if(period1[idxt1,] != period2[idxt2,]){
        if (idxt2 >= length2){
          lost <- lost + 1
          idxt2 <- 1
          break
        }
        idxt2 <- idxt2 + 1
      } else if (period1[idxt1,] == period2[idxt2,]){
        idxt2 <- 1
        break
      }
    }
    idxt1 <- idxt1 + 1
  }
  lost
}

lostcustomeryoy(2020,2021)
