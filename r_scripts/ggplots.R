###########################
### ggplots
### 2/19/26

# required packages 
library(ggplot2)
library(ggthemes)
library(patchwork)
# install.packages("ggthemes")
# install.packages("patchwork")

# load our dataset (built in mpg dataset)
d <- mpg

# my first ggplot (histogram)

histogram <- ggplot(
  data = d,
  mapping = aes(
    x = hwy
  )
) +
  geom_histogram()

histogram_colorful <- ggplot(
  data = d,
  mapping = aes(
    x = hwy
  )
) +
  geom_histogram(fill = "yellow", color = "chartreuse")

# density plot

density_colorful <- ggplot(
  data = d,
  mapping = aes(
    x = hwy
  )
) +
  geom_density(fill = "yellow", color = "chartreuse")

# scatterplot

scatter <- ggplot(
  data = d,
  mapping = aes(
    x = displ,
    y = hwy
  )
) +
  geom_point(fill = "yellow", color = "yellow") +
  geom_smooth(color = "blueviolet") + 
  geom_smooth(method = "lm", col = "chartreuse")



# themes and fonts

p1 <- ggplot(
  data = d,
  mapping = aes(
    x = displ,
    y = cty
  )
) +
  geom_point()

library(extrafont)

help(extrafont)
font_import()
