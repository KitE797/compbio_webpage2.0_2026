# User defined functions in R
# Kit Eller
# 2/5/26

#######################################
# looking at existing functions

sum(3,2)
3+2
`+`(3,2)

y <- 3
`<-`(yy,5)

print(read.table)


#######################################
# creating functions

### Start Function ###
addorsubtract <- function(x=1, y=2, z=T){
  # Name: addorsubtract
  # Operation: does some random math depending on the value of z
  # Inputs: x (numeric scalar value, default=1): one of the numbers to be operated on
  #         y (numeric scalar value, default=2): one of the numbers to be operated on
  #         z (logical, default=T): A switch to decide adding or subtracting
  # Outputs: numeric value resulting from addition or subtraction
  
  if(z=T){
    out <- x+y
  }else{
    out <- x-y
  }

  return(out)

}
### End Function ###
wow <- addorsubtract(x = 7, y = 3, z = T)



#######################################
# Hardy-Weinburg Function
### START FUNCTION:
hardy_weinburg <- function(p = runif(1)){
  # define each part
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2

  out_vec <- signif(c(p = p, q = q, AA = fAA, AB = fAB, BB = fBB), digits=3)

  return(out_vec)
}

hardy_weinburg()

#######################################
### Class 2/10/26

my_func <- function(a=3, b=4){

  z <- a+b

  return(z)

}

my_func(2,0)

my_bad_function <- function(a=3){
  z <- a+b
  return(z)
}
a=32
b=4
my_bad_function()

# passing global variables properly

my_func2 <- function(first, second){
  z <- first + second
  return(z)
}

my_func2(a,b)


hardy_weinburg <- function(p = runif(1)){

  if(p > 1 | p <0){
    stop("Function failure: p must be greater than 0 but less than 1")
  }

  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2

  out_vec <- signif(c(p = p, q = q, AA = fAA, AB = fAB, BB = fBB), digits=3)
  return(out_vec)
}

hardy_weinburg(12)

###########################

fit_linear <- function(x=runif(20), y=runif(20)){

  # regression function
  # FUNCTION: fit_linear
  # PURPOSE: fits a simple linear model
  # INPUTS: numeric vector or predictors x and response y
  # OUTPUTS: slope and p value
  
  my_mod <- lm(y~x)

  my_out <- c(slope=summary(my_mod)$coefficients[2,1])
  
  p_val <- summary(my_mod)$coefficients[2,4]

  plot(x=x, y=y)

  return(my_out)
}


var1 <- 1:20
var2 <- 21:40

fit_linear(var1, var2)

### more complicated defaults

fit_linear <- function(p=NULL){

  # regression function
  # FUNCTION: fit_linear
  # PURPOSE: fits a simple linear model
  # INPUTS: numeric vector or predictors x and response y
  # OUTPUTS: slope and p value

  if(is.null(p)){
    p <- list(x=runif(20), y=runif(20))
  }
  
  my_mod <- lm(p$y~p$x)

  p_val <- summary(my_mod)$coefficients[2,4]

  my_out <- c(slope=summary(my_mod)$coefficients[2,1], p_value = p_val)
  

  plot(x=p$x, y=p$y)

  return(my_out)
}

fit_linear()


my_parms <- list(x=1:10, y=sort(runif(10)))

fit_linear(my_parms)

