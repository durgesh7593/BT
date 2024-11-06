import pandas as pd 

def func(x):
  return (x+3)**2

def derivate(x):
    return 2*(x+3)

    gd = []
def gradient_descent(starting_x , lerning_rate , num_iterations):
  x  = starting_x
  gd.append(starting_x)
  for i in range(num_iterations):
    grad = derivate(x)
    x = x - lerning_rate * grad
    gd.append(x)
    print(f"Iteration {i+1}: x = {x}, f(x) = {func(x)}")
  return x ;


starting_x = 2
learning_rate = 0.1  # Step size
num_iterations = 50

# Perform Gradient Descent
min_x = gradient_descent(starting_x, learning_rate, num_iterations)
print(f"Local minimum occurs at x = {min_x}")

import seaborn as sns

sns.scatterplot(gd)

