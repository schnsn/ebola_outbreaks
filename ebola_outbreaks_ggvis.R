###### NON WORKING TESTBED #####

source("./header.R")


ggvis() %>%
  layer_points(data = ebola_data , ~Year, ~Cases, size := input_slider(100, 1000, value = 10

ggvis(data = ebola_data, ~Year, ~Cases) %>%
  layer_points()


data = ebola_total, ~Year, ~sum_Cases
               := input_checkbox(label = "bla", map = function(val) ifelse(val, ebola_data, ebola_total)))


# p <- ggplot() +
#   geom_point(data = ebola_total,
#              aes(x = Year, y = sum_Cases),
#              size = 6,
#              shape = 1) +
#   geom_point(data = ebola_data,
#              aes(x = Year, y = Cases, color = Country),
#              size = 4) +
#   scale_colour_brewer(palette="Set2") +
#   #  geom_smooth(data = ebola_total, aes(x = Year, y = sum_Cases), method = lm) +
#   labs(title = "Ebola Cases by Country\n(total cases indicated by circles)",
#        y = "Cases") +
#   theme()