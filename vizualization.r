library(ggplot2)
library(maps)
library(tidyverse)
library(plotly)

# Load apartment data
poland <- read_csv("C:/Users/amariik/Documents/Poland_project/Apartment_Prices_Poland/apartments_pl_2024_01.csv")

# Create a text column for tooltip
poland <- poland %>%
  mutate(text = paste0("<br>Price: ", price))  # or more fields

# Load Poland map data
poland_map_data <- map_data("world", region = "Poland")

# Monthly Price
poland <- poland %>%
  mutate(monthly_price = price / 12 / 10,  # Removes extra zero and convert yearly → monthly
         text = paste0("City: ", city,
                       "<br>Monthly Rent: ", round(monthly_price), " zł"))

pmap <- ggplot(poland_map_data, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), fill = "lightgray", color = "white", alpha = 0.5) +
  geom_point(data = poland, aes(x = longitude, y = latitude, text = text), 
             color = "red", size = 1.5, alpha = 0.7) +
  coord_fixed(1.3) +
  theme_minimal()

<<<<<<< Updated upstream
=======
ggplotly(pmap, tooltip = "text")
>>>>>>> Stashed changes
