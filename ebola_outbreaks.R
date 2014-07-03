source("./header.R")

## make plots:
p <- ggplot() +
  geom_point(data = summarise(group_by(ebola_data, Year),
                              Deaths = sum(Deaths)),
             aes(x = Year,
                 y = Deaths),
             size = 6,
             shape = 1) +
  geom_point(data = ebola_data,
             aes(x = Year, y = Deaths, color = Country),
             size = 4) +
  scale_colour_brewer(palette="Set2") +
#  geom_smooth(data = ebola_total, aes(x = Year, y = Deaths), method = lm) +
  labs(title = "Ebola Deaths by Country\n(total deaths indicated by circles)") +
  theme()
pdf(file = "./plots/ebola_deaths.pdf", width = 12, height = 8)
p
dev.off()

p <- ggplot() +
  geom_point(data = summarise(group_by(ebola_data, Year),
                              Cases = sum(Cases)),
             aes(x = Year,
                 y = Cases),
             size = 6,
             shape = 1) +
  geom_point(data = ebola_data,
             aes(x = Year, y = Cases, color = Country),
             size = 4) +
  scale_colour_brewer(palette="Set2") +
  #  geom_smooth(data = ebola_total, aes(x = Year, y = Cases), method = lm) +
  labs(title = "Ebola Cases by Country\n(total cases indicated by circles)") +
  theme()
pdf(file = "./plots/ebola_cases.pdf", width = 12, height = 8)
p
dev.off()

p <- ggplot() +
  geom_line(data = summarise(group_by(ebola_data, Year),
                              Deaths = sum(Deaths)),
             aes(x = Year,
                 y = Deaths),
            color = "red") +
  geom_line(data = summarise(group_by(ebola_data, Year),
                             Cases = sum(Cases)),
             aes(x = Year, y = Cases)) +
  #  geom_smooth(data = ebola_total, aes(x = Year, y = Deaths), method = lm) +
  labs(title = "Ebola Cases vs Deaths by Country\n") +
  theme()
pdf(file = "./plots/ebola_cases_vs_deaths.pdf", width = 12, height = 8)
p
dev.off()
