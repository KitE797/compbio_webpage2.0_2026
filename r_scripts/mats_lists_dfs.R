#### Matrixes, lists, dataframes
# Kit Eller
# 1/29/26

##################################
my_vec <- 1:12
##################################
# matrixes:
# need number of cells you want within the matrix, then nrow is number of rows
m <- matrix(data = my_vec, nrow=4)

# by row:
m<-matrix(data=my_vec, nrow=3, byrow=T)

##################################
# lists:

my_list<-list(1:10, matrix(1:8, nrow=4, byrow=T), letters[1:3], pi)
print(my_list)

# gets first element in list
my_list[1]

# gets first actual object in list 
my_list[[1]]

# indexing into a matrix
my_list[[2]][1,1] #[rows, cols]

# naming a list

my_list2 <- list(tester=FALSE, little_m=matrix(1:9, nrow=3))
my_list2

# named objects in lists
my_list2$little_m[2,3]

my_list2$little_m[1,]
my_list2$little_m[,1]

my_list2$little_m[1] # no comma, treats it as a vector

##################################

unrolled <- unlist(my_list2)

##################################

library(ggplot2)

##################################

y_var <- runif(10)
x_var <- runif(10)

# regress
my_model <- lm(y_var~x_var)

qplot(x=x_var, y=y_var)
print(my_model)

# explore structure
str(summary(my_model))

summary(my_model)$coefficient[,1]

u <- unlist(summary(my_model))

pval <- u$coefficients8

##################################
# data frames

var1 <- 1:12
var2 <- rep(letters[1:3], 4)
var3 <- runif(12)

# creating data frame
df <- data.frame(var1, var2, var3)

str(df)

df$var2[2]

df[2,2]

# expanding data frame
new_data <- list(var1=13, var2="d", var3=0.77)

# "row bind"
df2 <- rbind(df, new_data)

head(df2)
tail(df2)

View(df2)

new_var <- rnorm(13)

# "column bind"
df3 <- cbind(df2, new_var)

# using assignment operator

char_var <- rep("AAA", 13)

df3$charV <- char_var

##################################
# writing data frames

write.csv(df3, "data/my_dataframe.csv")
data <- read.csv("data/my_dataframe.csv")

