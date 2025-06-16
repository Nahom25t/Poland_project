library(ggplot2)
library(maps)
library(tidyverse)
library(plotly)

library(tidyverse)



poland <- read_csv("Apartment_Prices_Poland/apartments_pl_2024_01.csv")

poland_map_data <- map_data("world", region = "Poland")

ggplot(poland_map_data, aes(x = long, y = lat, fill = 0.5)) +
    geom_polygon(aes(fill = 1), color = "white", alpha = 0.5) +
    geom_point(data = poland, aes(x = longitude, y = latitude), color = "red", size = 1, alpha = 0.6) +
    coord_fixed(1.3) +
    theme_minimal()


