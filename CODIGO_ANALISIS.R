library(readr)
library(tibble)
library(dplyr)
library(ggplot2)
library(tidyverse)

file.choose()

BASE_ORIGINAL <- read_delim("C:\\Proyectos Actuales\\TAREA TRACHEOPHYTAS\\bases de datos\\DATOS_TRACHEOPHYTA_COLOMBIA\\tracheophyta_colombia.csv")


# NUMERO DE ESPECIES DE PLANTAS VASCULARES EN COLOMBIA 
BASE_ORIGINAL %>%
  filter(!is.na(species)) %>% 
  summarise(Total_Colombia = n_distinct(species))


#NUMERO DE ESPECIES POR CLASE

clases_riqueza <- BASE_ORIGINAL %>% 
 filter(!is.na(class)) %>% 
  group_by(class) %>% 
  summarise(n_especies = n_distinct(species, na.rm = TRUE)) 



clases_riqueza %>% 
  pivot_wider(names_from = class,
              values_from = n_especies) %>% 
  ggplot() +
  geom_bar(aes(Cycadopsida:Magnoliopsida))
  

clases_riqueza %>% 
  pivot_wider(names_from = class,
              values_from = n_especies) %>% 
  ggplot() +
  geom_bar(aes(Cycadopsida:Magnoliopsida))


