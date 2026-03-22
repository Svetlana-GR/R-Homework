# загрузка всех имеющихся библиотек:-)
library(purrr)
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)
library(forcats)
library(readr)
library(stringr)
library(tibble)
library(psych) 
library(skimr)
library(plotly)
library(leaflet)
library(DT)
library(rdracor)
library(tinythemes)
library(stringi)
library(udpipe)
library(wordcloud2)
library(stopwords)

# создаем вымышленные данные о способах коммуникации в 2026 году
data <- data.frame(
  method = c("Мессенджеры", "VPN", "Email", "Звонки", "Форумы", "Личные встречи",
             "Голубиная почта", "Гонцы", "Костры", "Телепатия","ICQ"),
  users_millions = c(80, 45, 30, 25, 15, 10, 0.001, 0.002, 0.003, 0.004, 0.001)
)
# отрисовываем график
bad_plot <- ggplot(data, aes(x = reorder(method, -users_millions), y = users_millions)) +
  geom_bar(stat = "identity", fill = "dodgerblue4", color = "black") +
  theme_minimal() +
  labs(
    title = "Способы коммуникации в 2026 году",
    x = "Способ связи",
    y = "Млн пользователей (или сигнальщиков)"
  ) +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, size = 6, color = "grey50"),
    axis.title.y = element_text(size = 8),
    plot.title = element_text(hjust = 0.5, size = 12, face = "bold", color = "firebrick"),
    legend.position = "none"
  ) +
  scale_y_continuous(breaks = seq(0, 100, by = 20), limits = c(0, 100)) +
  geom_text(aes(label = ifelse(method %in% c("Голубиная почта", "Гонцы", "Костры", "Телепатия"),
                               paste0(users_millions, " (", round(users_millions*1e6), ")"),
                               users_millions)),
            vjust = -0.5, size = 3) +
  annotate("text", x = 7, y = 5,
           label = "P.S. Голуби                                                             Телепаты не одобряют блокировки",
           color = "darkgreen",size = 3, angle = 30) +
  annotate("segment", x = 7, xend = 10.2, y = 3, yend = 4,
           arrow = arrow(length = unit(0.2, "cm")), color = "darkgreen") +
  coord_flip()

View(bad_plot)


