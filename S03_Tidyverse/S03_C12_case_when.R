#S03_C12_case_when
#Case_When

#La función case_when es útil para vectorizar sentencias condicionales. Es similar a ifelse pero puede generar cualquier número de valores, en lugar de solo VERDADERO o FALSO. Aquí hay un ejemplo que divide los números en negativos, positivos y 0:

x <- c(-2, -1, 0, 1, 2)
case_when(x < 0 ~ "Negative", x > 0 ~ "Positive", TRUE ~ "Zero")


#Un uso común para esta función es definir variables categóricas basadas en variables existentes. Por ejemplo, supongamos que queremos comparar las tasas de asesinatos en tres grupos de estados: Nueva Inglaterra, West Coast, South y otros. Para cada estado, debemos preguntar si está en Nueva Inglaterra, si no es así, preguntamos si está en la costa oeste, si no, preguntamos si está en el sur y si no, asignamos otro. 

#Así es como usamos case_when para hacer esto:

data(murders)
murders %>% 
  mutate(group = case_when(
    abb %in% c("ME", "NH", "VT", "MA", "RI", "CT") ~ "New England",
    abb %in% c("WA", "OR", "CA") ~ "West Coast",
    region == "South" ~ "South",
    TRUE ~ "other")) %>%
  group_by(group) %>%
  summarize(rate = sum(total) / sum(population) * 10^5) %>%
  arrange(rate)
