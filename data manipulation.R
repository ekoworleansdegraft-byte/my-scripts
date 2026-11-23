#DATA MANUPULATION
data <- read.csv('')
library(tidyverse)
view(msleep)
glimpse(msleep)
#Renaming columns
msleep %>% 
  rename('conserv'='conservation')
#Reordering columns or variables
msleep %>%
select(name,vore,everything())
#Changing data types
class(msleep$vore)
msleep$vore <- as.factor(msleep$vore)
class(msleep$vore)
msleep %>% 
  mutate(vore=as.character(vore)) %>% 
  glimpse()

#Selecting Variables
class(msleep$vore)
class
msleep %>% 
  select(2:4, awake,starts_with("sleep"),
                                contains("wt")) %>% 
           names()
         unique(msleep$order) 
         msleep %>% 
           filter((order=='Carnivora'|order=='Primates')& 
           sleep_total>8) %>% 
           select(name,order,sleep_total) %>% 
           arrange(-sleep_total) %>% 
           view
msleep %>% 
  mutate(brainwt_kg=brainwt*1000) %>%
  view()
msleep$brainwt
msleep$brainwt>0.01
size_of_brian <- msleep %>% 
  select(name,brainwt) %>% 
  drop_na(brainwt) %>%
  mutate(brain_size = if_else (brainwt > 0.01,'large','small'))
size_of_brian %>%
  mutate(brain_size=recode(brain_size,
                           'large'=1,
                           'small'=2))
install.packages('gapminder')
library(gapminder)
view(gapminder)
data <- select(gapminder, country, year, lifeExp)
 wide_data <- data
orleans <- wide_data %>% 
  pivot_wider(names_from=year,values_from = lifeExp)
view(wide_data)  
longdata <- orleans %>% 
  pivot_longer(2;13,names_to = "year",values_to = "lifeExp")
view(longdata)  
