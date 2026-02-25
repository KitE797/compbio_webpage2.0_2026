# Atomic vectors part 1
# This is a script describing vectors in R
# 22 Jan 2026
# Kit Eller

#################################################
# START OF SCRIPT
# Atomic vectors part 1
#################################################

x <- 5
print(x)

# not allowed to use in this class:
y = 3

#################################################

# Snake Case:
plant_height_and_whatever <- 3

# Camel Case:
plantHeightAndWhatever <- 4

# Not preferred, reserve for temp variables:
plant.height.and.whatever <- 2

#################################################

# DIMS | Homogeneous | Heterogenenous
#-------------------------------------
# 1D   | Vector      | List
#-------------------------------------
# 2D   | Matrix      | Data frame
#-------------------------------------
# N-D  | Array .......... etc

#################################################

#### 1d atomic vector:
z <- c(3.2,5,5,6)
print(z)
# type 'double'
typeof(z)

# can also use c() to 'flatten' vectors. Creates one flat vector, not an array
z <- c(c(3.2, 3), c(3,5))
print(z)
is.numeric(z)
is.character(z)

#################################################

#### character strings:
t <- "perch"
print(t)

# character vector:
t <- c("perch","bass","trout")
print(t)
t[1]
t[2]
t[3]
typeof(t)
is.numeric(t)

#################################################

#### boolean vector (logical vector)

u <- c(TRUE, FALSE, TRUE, T, F, T, T, T, T, T)
print(u)
is.logical(u)
typeof(u)
mean(u)

#################################################
#### vector properties

### type:
typeof(z) # gives type
is.numeric(z) # gives logical
z_2 <- as.character(z) # coerces variable
typeof(z_2)
is.numeric(z_2)

### length:
length(t)

### names:
# random number generator
z <- runif(5)
print(z)

# names() returns names if it has it
names(z)

# but can also be used to store names
names(z) <- c("A","B","C","D","E")
print(z)

# reset names:
names(z) <- NULL
names(z)

#################################################
#### Special data types

# NA (not any)
w <- c(3.2, 3, 3, NA)

print(w)
typeof(w)
length(w)
typeof(w[4])
sum(w)
sum(w, na.rm=T)

# NaN (missing)
p <- 0/0
print(p)

# Inf (infinity)
i <- 1/0
print(i)
n <- -1/0
print(n)

# NULL
o <- NULL
print(o)

#################################################
#### Vectorization:
f <- c(10, 20, 30, 40, 50, 60)
f+1
-f

g <- c(1,2,3)
f+g
f/g
g/f

# recycling:
m <- c(1,2)
f+m

#################################################
# Atomic vectors part 2
# 1/27/26
#################################################

z <- vector(mode="numeric", length=0)

print(z)

#################################################

# Dynamic creation: don't do this in R, can do this in python
z <- c(z, 5)
print(z)

# For R, create a vector with a predefined length
z <- rep(0, 100)
print(z)
length(z)

#################################################

z <- rep(NA, 100)
print(z)
typeof(z)
z[1] <- "Vermont"
head(z)
typeof(z)

#################################################

my_vector <- runif(100)
my_names <- paste("Species", seq(1:length(my_vector)), sep="")

names(my_vector) <- my_names

str(my_vector)

#################################################
# using the rep function

rep(x=0.5, times=6)

my_vec <- c(1,2,3)

rep(x=my_vec, times=6, each=3)

help(rep)

#################################################

seq(1:10)

x <- seq(from = 2, to = 4, length=5)

# this is slow:
my_vec <- 1:length(x)

seq_along(my_vec)

#################################################

# generating random values
set.seed(123)
runif(5)
runif(n=3, min=100, max=101)

out <- rnorm(n=500, mean=100, sd=30)

hist(out)

#################################################

# random sampling

long_vec <- seq_len(10)

sample(x=long_vec, size=5, replace=T)

#################################################

# weighted sampling from a vec

weights <- c(rep(20,5), rep(100, 5))

sample(x=long_vec, replace=T, prob=weights)

#################################################

# subsetting vectors
z <- c(3.1, 9.2, 1.3, 0.4, 7.5)

z[c(2,3)]

x <- 1:5
y <- c(1:3, 7, 7)

x==2
x!=2

x==5 & y==7

x==1 | y==7

# only satisfied when one is true and one is false
xor(x==3, y==3)

set.seed(90)
z <- runif(10)
z<0.5
z[z<0.5]
# gives index location of where = TRUE
which(z<0.5)

z[which(z<0.5)]

zd <- c(z, NA, NA)

# keeps NA:
zd[zd<0.5]

# drops NA:
zd[which(zd<0.5)]
