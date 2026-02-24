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

#############################################
### Class 2/24/26
### Using patchwork:

d <- mpg

p2 <- ggplot(data=d, mapping=aes(
  x = fl,
  fill = fl
)) + geom_bar() + labs(
  fill = "Fuel Type",
  y = "Count",
  title = "My Plot",
  x = "Fuel Type"
)

g1 <- ggplot(data = d) + aes(
  x = displ, y = cty
) + geom_smooth()

g2 <- ggplot(data = d) + 
  aes(x = fl) +
  geom_bar(fill="tomato", color = "black")

g3 <- ggplot(data=d) +
  aes(x = displ) + 
  geom_histogram(fill="royalblue", color="black")

g4 <- ggplot(data = d) +
  aes(x = fl, y = cty, fill = fl) +
  geom_boxplot() +
  theme(legend.position = "none")

# Using patchworK:
g1 + g2

# adding plot layout:
g1+g2+g3+plot_layout(ncol = 1)

# change relative area of each plot
g1+g2+plot_layout(ncol = 2, widths = c(2,1))

# adding spacers
g1+plot_spacer()+g2

# nested layouts
g1 + {
  g2 + {
    g3 +
      g4 +
      plot_layout(ncol = 1)
  }
} + plot_layout(ncol = 1)

# - operator for subtrack placement
g1+g2+g3-g4+plot_layout(ncol=1)

# using | and /
(g1 | g2 | g3) / g4 + plot_annotation("Title Here:", caption = "made this patchwork")

# adding tags
g1 / (g2 | g3) + plot_annotation(tag_levels = "A")


#######################################################
### Using facet:

m1 <- ggplot(data = d) + aes(x = displ, y = cty) + geom_point() + geom_smooth(method = "lm")

m1 + facet_grid(class~fl)

# facet for only 1 variable

m1+facet_grid(class~.)


m1+facet_wrap(~class)

m1+facet_wrap(~class + fl, drop=F)



