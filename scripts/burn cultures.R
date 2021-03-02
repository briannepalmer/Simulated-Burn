
library(tidyverse)

data <- read.csv("data/burn_cultures.csv")
data$Depth <- as.factor(data$Depth)

ggplot(data %>% filter(Colonies == "Y"), aes(x = Type, y = Depth, fill = Temp)) + geom_bar(stat = "identity", position = "dodge")

p1 <- ggplot(data, aes(Type, Depth,  fill = Colonies)) + geom_tile() + theme_bw() + facet_grid(. ~ Temp)+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

p2 <- ggplot(data, aes(ID, Depth, fill = Colonies)) + geom_tile(color="white", size=0.1) + theme_bw() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
library(patchwork)

pdf("figures/colonies heat map.pdf", width= 8, height = 10)
p2
dev.off()


