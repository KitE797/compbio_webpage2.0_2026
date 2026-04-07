# Intro to Python
# More support and faster than R
# Uses nesting instead of all of the brackets (aesthetics are important in the philosophy)
# plotly package can make interactive graphs, also for graphs are matplotlib, seaborn
# other packages include scipy, panda, numpy, etc.

# Anatomy of a function
# object = function(data = ds, method = "mean", num = 10) only difference from R is = instead of <-

# Python objects have methods
# object.python_method(method = "mean", num = 10)

# Installing libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
# Importing package as abbreviated version - these are canonical abbreviations that you always use
# Script language at heart so you generally write full script and just run it unless you're debugging but positron works like a debugger (line by line)

# Have to explicitly state the package the function you're using is from so:
# np.mean()

###################################
# Objects, Methods, and Functions
###################################

print("I love Python") # Always use print statement (R just uses it as a default but Python prefers explicit)

greeting = "Hello"
print(greeting)

scalar = 6 # Integer value

out = scalar * 3 # Doing math with an object
print(out)

myList = [34, 7, 98] # Creating a list

myList.append(33) # Our first method, lists (object since not a vector language) have built in methods

len(myList) # length function

# data structures:
#--------------------------------

# make a list of colors
a_list = ["blue", "green", "red"]
print(a_list)

# indexing into a list
print(a_list[0]) # 0 is first element in list

first_el = a_list[0]
print(first_el)

# looking at data types
nums = [1, 2, 5, 8,]
chars = ["a", "b", "c"]
boolean = [True, True, False] # Not all caps or just T/F like R

# mixed lists
mixed = [1, 2, True, "blue", 5]

# checking data types
type(nums)
type(nums[0])
# type returns highest level object type so list over integer

# negative indexing
mixed[-1] # returns last element

# ranged indexing
mixed[1:4]
mixed[:4] # Shows up to 4 places not to element 4 (3rd element)
mixed[2:]

# is an item in the list
1 in mixed

# changing elements
mixed[4] = "green"

# insert in a specific position without overwriting
mixed.insert(0, "start")

# other methods
# extend, remove, pop (add to the end), clear (delete)



print(mixed)

[x for x in mixed]

[x for x in mixed if isinstance(x,str)]


####################
# dictionaries








dataTypes = {
    "string":"thing",
    "integer":3,
    "float":3.1432,
    "list":[1,2,3,"a"],
    "boolean":False
}

# calling values by key name in brackets
dataTypes["string"]

dataTypes.get("boolean")

dataTypes.keys()
dataTypes.values()
dataTypes.items()

dataTypes["age"] = 35




arr1 = np.array([0,1,2,3,4,5,6,7,8,9])

arr1[3]
arr1[-1]
arr1[:3]

arr1[1:8:4] # last place in indexing encodes every nth place in array

# 2d array
arr2 = np.array([[1,2,3], [4,5,6], [7,8,9]])

# 3d array
arr3 = np.array([[[1,2],[3,4]],[[5,6],[7,8]]])

arr3[1,0,1]

arr1.ndim()
arr2.ndim()
arr3.ndim()


arr1.shape()
arr2.shape()
arr3.shape()

arr1.type()
arr2.type()
arr3.type()


first = np.array([1,2,3])
second = np.array([4,5,6])

long_array = np.concatenate((first, second))

np.concatenate((arr2, arr2), axis = 1)

np.array_split(arr1, 2)





### random numbers
 from numpy import random

random.seed(seed = 100)

randomInt = random.randint(50) # gives 1 int from 0 to 50

random.rand(50) # gives 50 values 0 to 1

random.rand(50, 5, 10)

random.choice(arr1) # random number from arr1

random.choice(arr1, size = (3,3))

random.choice([0,1], p = [0.01, 0.99], size = 1000)



############################################################
### Class 3/24/26

x = random.normal(loc = 5, scale = 3, size = 20)

plt.hist(x)
plt.show()



x=random.binomial(n = 10, p = 0.5, size = 300)
print(x)

plt.hist(x)

w=random.uniform(low = 1, high = 10, size = 50)
plt.hist(w)
plt.show()



###############################
a = 6

if a > 5:
    print("a is greater than or equal to 5")
else:
    if a == 5:
        print("a is exactly 5")
    else:
        print("a is lesser than 5")


a = 3
b = 3
operation = "add"

if operation == "mult":
    y = a*b
elif operation == "div":
    y = a/b
elif operation == "add":
    y = a+b
elif operation == "sub":
    y = a-b
else:
    y = "I don't know that operation (try mult, div, add, sub)"



print(y)








###############################
### Loops:

l=[10,20,30]

for i in range(3):
    print(l[i])




# loop on an object directly
x = ["blue", "green", "red"]

for i in x:
    print(i)

arr1 = np.array([0,1,2,3,4,5,6,7,8,9])

rnd=random.uniform(low = 1, high = 5, size = 10)

outList = []

for i in range(len(arr1)):
    outList.append(rnd[i] + arr1[i])


# nested loop with elif

rnd2D = random.uniform(low = 0, high = 1, size = (3,3))

matOut = np.empty(shape = (3,3))

shp = rnd2D.shape

for i in range(shp[0]):
    for j in range(shp[1]):
        if rnd2D[i,j] >= 0.5:
            matOut[i,j] = rnd2D[i,j] * 10
        else:
            matOut[i,j] = rnd2D[i,j] / 10





############################################
# PANDAS DFs

dates = pd.date_range("20130101", periods = 6)

df = pd.DataFrame(np.random.randn(6,4), index = dates, columns = list("ABCD"))

df.head(4)
df.tail(4)

df.index
df.columns

df.describe

df.to_numpy() # numpy conversion

df["A"]
df.loc[:, ]



#############
# read in csv

ds = pd.read_csv("iris.data.csv")

print(ds)














##################################################################
### FUNCTIONS in PYTHON

# basic function structure

def number_adder(a, b):
    out = a + b
    return(out)

number_adder(a = 3, b = 10)

##################################################################
### Plotting in python

import seaborn as sns

sns.set_theme(style = "ticks", font_scale = 1.5)


