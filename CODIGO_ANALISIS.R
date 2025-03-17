library(readr)
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


#GRAFICA DE CLASES
clases_riqueza %>% 
  ggplot(aes(x= reorder(class, desc(n_especies)), y= n_especies), fill = "gray") +
  geom_col() +
  theme_classic() +
  labs(x = "Clase",
       y = "Número de Especies") +
  theme(axis.text.x = element_text(family = "Arial",
                                    angle = 45,
                                    hjust = 1))


#ESPECIES EN CÓRDOBA

BASE_ORIGINAL %>%  
  filter(stateProvince == "Córdoba") %>% 
  group_by(stateProvince) %>% 
  summarise(n_especies = n_distinct(species, na.rm = TRUE))


#ESPECIES REPORTADAS POR LA UNIVERSIDAD DE CÓRDOBA

BASE_ORIGINAL %>%  
  filter(stateProvince == "Córdoba" & institutionCode == "UNICORDOBA") %>% 
  group_by(stateProvince) %>% 
  summarise(n_especies = n_distinct(species, na.rm = TRUE))
  
(576/2011)*100
488229
