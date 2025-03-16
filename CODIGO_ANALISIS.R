library(readr)library(tidyverse)

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
  ggplot(aes(x= reorder(class, desc(n_especies)), y= n_especies), fill = "gray") +
  geom_col() +
  theme_classic() +
  labs(x = "Clase",
       y = "Número de Especies") +
  theme(axis.text.x = element_text(family = "Arial",
                                    angle = 45,
                                    hjust = 1))



















clases_riqueza %>% 
  ggplot(aes(x = class, y = n_especies)) +
  geom_col() +  # geom_col es como geom_bar pero con y ya calculada
  labs(
    title = "Número de especies por clase",
    x = "Clase",
    y = "Número de especies"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Para que las etiquetas no se superpongan

