### Basic coding with for loops
# 2/10/26

# basic for loop:
for(i in 1:5){
  cat("stuck in a loop", "\n")
  cat(3+2, "\n")
  cat(runif(1), "\n")
}


my_dogs <- c(
  "chow",
  "akita",
  "malamute",
  "husky",
  "samoyed",
  "wheaten terrier"
)

for(i in 1:length(my_dogs)){
  
  for(i in 1:length(my_dogs)){
    cat("i = ", i, "my_dogs[i] = ", my_dogs[i], "\n")
  }
}

my_bad_dogs <- NULL

for(i in 1:length(my_bad_dogs)){
  
  for(i in 1:length(my_bad_dogs)){
    cat("i = ", i, "my_bad_dogs[i] = ", my_bad_dogs[i], "\n")
  }
}

###################################################################
### Continuing for loops
# 2/12/26

my_dogs <- c(
  "chow",
  "akita",
  "malamute",
  "husky",
  "samoyed",
  "wheaten terrier"
)

##### Five tips you should know about for loops

### 1. Don't loop if you don't need to

for(i in seq_along(my_dogs)){
  my_dogs[i] <- toupper(my_dogs[i])
}

# ^ works but why would you do this

tolower(my_dogs)

# ^ way easier!

### 2. Don't change dimensions in the loop

my_dat <- runif(1)

# seems to be fine...
for(i in 2:10){
  temp <- runif(1)
  my_dat <- c(my_dat, temp)
  cat("Loop number = ", i, "\n", "\t", my_dat[i], "\n")
}

# but actually would take a while as you increase the number of iterations
for(i in 2:5000){
  temp <- runif(1)
  my_dat <- c(my_dat, temp)
  cat("Loop number = ", i, "\n", "\t", my_dat[i], "\n")
}

### Don't write a loop if you can vectorize it

my_dat <- 1:10

for(i in seq_along(my_dat)){
  my_dat[i] <- my_dat[i]+my_dat[i]^2
  cat("Loop number = ", i, "\n", "\t", my_dat[i], "\n")
}

z <- 1:10
z <- z + z^2

### 4. Understand the difference between the counter variable (i) and other variables (z[i])

z <- c(10,2,4)

for(i in seq_along(z)) {
  cat("i = ", i, "z[i] = ", my_dat[i], "\n")
}

### 5. Don't loop through everything
z <- 1:20

for(i in seq_along(z)){
  if(i %% 2 == 0) next
    print(i)
}

z_odd <- z[which(z %% 2 != 0)]

###########################################################################3
# look at the parameter space of the logistic
# growth model with a for loop

log_growth <- function(N0=1, r=0.1, K=100, t_fin=100, t_step=1){
    # log_growth takes N0 (initial pop size), r (growth rate), K (carrying capacity), t_fin (the final time), and t_step (the number by which t increases)

    # times: sequences from 0 to t_fin in steps of t_step
    times <- seq(from = 0, to = t_fin, by = t_step)
    
    # pop_df: creates a df with column time (=times) and population size.
    pop_df <- data.frame(t = times, N = NA)

    # for loop: finds the length of times, then for every integer, finds t at location i of pop_df. Then, it runs the log growth equation for that number. N (output of equation) is then placed into N at location i of pop_df.
    for(i in 1:length(times)){

        t <- pop_df$t[i]

        N <- ( K ) / ( 1 + ( ( K - N0 ) / N0 ) * ( exp(-r * t)) )

        pop_df$N[i] <- N
    }

    # actually return the dataframe
    return(pop_df)

}


# creating vector of r
r_vec <- seq(from = 0, to = 1, by = 0.001)
container_vec <- rep(NA, length(r_vec))

for(i in seq_along(r_vec)){
  temp_df <- log_growth(r = r_vec[i])
  max_n <- max(temp_df$N)
  container_vec[i] <- max_n # storage vector
}

growthDF <- data.frame(r_vec, container_vec)
head(growthDF)

plot(growthDF$r_vec, growthDF$container_vec)

################################################
### For loops cont
### 2/17/26

# Name: rand_walk
# Purpose: conducts a random walk
# Input:
#     times = number of time steps
#     n1 = initial pop size
#     lamda = finite rate of increase
#     noise_sd = 10
# Output: vector n with population size > 0 until extinct.

library(ggplot2)

rand_walk <- function(times = 100, n1 = 50, lambda = 1, noise_sd = 10){
  n <- rep(NA, times) # create output vector
  n[1] <- n1 # initialize pop size
  noise <- rnorm(n = times, mean = 0, sd = noise_sd) # created noise / error

  for(i in 1:(times-1)){
    n[i+1] <- lambda * n[i] + noise[i]
    if(n[i+1] <= 0){
      n[i+1] <- NA
      cat("Population extinction at time ", i+1, "\n")
      break
    }
  }

  return(n)

}


rand_walk(times = 300, n1 = 200, lambda = 1, noise_sd = 10)

x <- rand_walk()

# plotting with default values (noisy)
qplot(x = 1:100, y = rand_walk(), geom="line")

# plotting with no noise
qplot(x = 1:100, y = rand_walk(noise_sd = 0), geom="line")

# no noise and adjust lambda
qplot(x = 1:100, y = rand_walk(noise_sd = 0, lambda = 0.9), geom="line")

# add some stoichasticty back, make lambda >1
qplot(x = 1:100, y = rand_walk(noise_sd = 7, lambda = 1.03), geom="line")




##############
for(i in 1:5){
  for(j in 1:5){
    for(k in 1:5){
      print(i, ", ", j, ", ", k, "\n")
    }
  }
}


############################
# 2D parameter sweep for log growth function

r_vals <- seq(0, 1, length.out = 100)
k_vals <- seq(10, 1000, length.out = 100)

storage_matrix <- matrix(NA, nrow = length(r_vals), ncol = length(k_vals))

for(i in seq_along(r_vals)){
  for(j in seq_along(k_vals)){
    # run log growth
    temp_df <- log_growth(r = r_vals[i], K = k_vals[j])

    # storage max N in 2D matrix
    storage_matrix[i,j] <- max(temp_df$N)
  }
}

log_growth(r = r_vals[i], k = k_vals[j])


###########
### Create function off above:

r_vals <- seq(0, 1, length.out = 100)
k_vals <- seq(10, 1000, length.out = 100)

growth_sweep_mat <- function(r_vec, k_vec){
  storage <- matrix(NA, nrow=length(r_vec), ncol=length(k_vec))

  for(i in seq_along(r_vec)){
    for(j in seq_along(k_vec)){
      # run log growth
      temp_df <- log_growth(r = r_vec[i], K = k_vec[j])

      # storage max N in 2D matrix
      storage[i,j] <- max(temp_df$N)
  }
}
  return(storage)

}

growth_mat <- growth_sweep-mat(r_vec = r_vals, k_vec = k_vals)



growth_sweep_df <- function(r_vec, k_vec){
  # create storage dataframe
  df_l <- length(r_vec)*length(k_vec)

  r_out <- rep(NA, df_l)
  k_out <- rep(NA, df_l)
  maxn_out <- rep(NA, df_l)

  storage_df <- data.frame(r_out, k_out, maxn_out)

  # storage <- matrix(NA, nrow=length(r_vec), ncol=length(k_vec))

  # row indexing:
  counter <- 1

  for(i in seq_along(r_vec)){
    for(j in seq_along(k_vec)){
      # run log growth
      temp_df <- log_growth(r = r_vec[i], K = k_vec[j])

      # storage max N in 2D matrix
      # storage[i,j] <- max(temp_df$N)
      storage_df$maxn_out[counter] <- max(temp_df$N)
      storage_df$r_out[counter] <- r_vec[i]
      storage_df$k_out[counter] <- k_vec[j]
      counter <- counter + 1
  }
}
  return(storage_df)

}


growth_df <- growth_sweep_df(r_vals, k_vals)

ggplot(growth_df, aes(x = r_out, y = k_out, fill = maxn_out)) + geom_tile()






