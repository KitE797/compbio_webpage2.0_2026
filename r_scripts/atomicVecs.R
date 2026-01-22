# This is a script describing vectors in R
# 22 Jan 2026
# Kit Eller

#################################################
# START OF SCRIPT

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
