library(ggplot2)
library(maps)
library(tidyverse)

# Read your CSV file into a data frame called 'poland'
poland <- read_csv("Apartment_Prices_Poland/apartments_pl_2024_06.csv")

# Plot apartment locations on the map of Poland
ggplot() +
    borders("poland", colour = "gray50", fill = "gray90") +
    geom_point(data = poland, aes(x = longitude, y = latitude, color = price), alpha = 0.7) +
    scale_color_viridis_c() +
    labs(title = "Apartment Prices in Poland", x = "Longitude", y = "Latitude", color = "Price")
