# MIT License

# Copyright (c) 2020 Jean-Jacques François Reibel

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# R added S4 and Reference Classes later on
# S4, like S3 classes, are immutabe
# Reference classes are the way to do OOP in R with mutable classes
# First I demonstrate with S3 because they were introduced in the original version of R
# Any functions used actually make a copy

# Method 1: Functions as classes
# Car = function(wheelsIn = "null", doorsIn = "null", cylindersIn = "null") {
#   this <- list(wheels = wheelsIn, doors = doorsIn, cylinders = cylindersIn)
#   class(this) <- append(class(this), "Car")
#   return(this)
# }

# cat("Creating car.", "\n")
# subaru <- Car(wheels = 4, doors = 4, cylinders = 4)
# cat("Wheel check: ", subaru$wheels, "\n")
# cat("Door check: ", subaru$doors, "\n")
# cat("Cylinder check: ", subaru$cylinders, "\n \n")
# cat("Adding wheel directly to car object.", "\n")
# subaru$wheels <- 5
# cat("Wheel check: ", subaru$wheels, "\n")
# cat("Door check: ", subaru$doors, "\n")
# cat("Cylinder check: ", subaru$cylinders, "\n \n")
######################################################################################
######################################################################################
######################################################################################
# Method 2: Lists as classes

car <- list(wheels = "null", doors = "null", cylinders = "null")
addWheels <- function(obj, wheelsIn) {
  w = wheelsIn
  obj$wheels = sum(obj$wheels, w)
}
addDoors <- function(obj, doorsIn) {
  d = doorsIn
  obj$doors = sum(obj$doors, d)
}
addCylinders <- function(obj, cylindersIn) {
  cyl = cylindersIn
  obj$cylinders = sum(obj$cylinders, cyl)
}
deleteWheels <- function(obj, wheelsIn) {
  w = wheelsIn
  obj$wheels = obj$wheels - w
}
deleteDoors <- function(obj, doorsIn) {
  d = doorsIn
  obj$doors = obj$doors - d
}
deleteCylinders <- function(obj, cylindersIn) {
  cyl = cylindersIn
  obj$cylinders = obj$cylinders - cyl
}

cat("Creating car.", "\n")
class(car) <- "subaru"
subaru <- environment()
subaru$wheels = 4
subaru$doors = 4
subaru$cylinders = 4
cat("Wheel check: ", subaru$wheels, "\n")
cat("Door check: ", subaru$doors, "\n")
cat("Cylinder check: ", subaru$cylinders, "\n \n")
cat("Adding wheel directly to car object.", "\n")
subaru$wheels = 5
cat("Wheel check: ", subaru$wheels, "\n")
cat("Door check: ", subaru$doors, "\n")
cat("Cylinder check: ", subaru$cylinders, "\n \n")
cat("Removing wheel using object method.", "\n")
deleteWheels(subaru, 1)
cat("Wheel check: ", subaru$wheels, "\n")
cat("Door check: ", subaru$doors, "\n")
cat("Cylinder check: ", subaru$cylinders, "\n")

# Method 3: Lists as Independent Classes
# The lines:
# class(car) <- "subaru"
# subaru <- environment()
# subaru$wheels = 4
# subaru$doors = 4
# subaru$cylinders = 4
# have been replaced with 
# subaru <- list(wheels = 4, doors = 4, cylinders = 4)
######################################################################################CODE
# car <- list(wheels = "null", doors = "null", cylinders = "null")
# addWheels <- function(obj, wheelsIn) {
#   w = wheelsIn
#   obj$wheels = sum(obj$wheels, w)
# }
# addDoors <- function(obj, doorsIn) {
#   d = doorsIn
#   obj$doors = sum(obj$doors, d)
# }
# addCylinders <- function(obj, cylindersIn) {
#   cyl = cylindersIn
#   obj$cylinders = sum(obj$cylinders, cyl)
# }
# deleteWheels <- function(obj, wheelsIn) {
#   w = wheelsIn
#   obj$wheels = obj$wheels - w
# }
# deleteDoors <- function(obj, doorsIn) {
#   d = doorsIn
#   obj$doors = obj$doors - d
# }
# deleteCylinders <- function(obj, cylindersIn) {
#   cyl = cylindersIn
#   obj$cylinders = obj$cylinders - cyl
# }
# cat("Creating car.", "\n")
# subaru <- list(wheels = 4, doors = 4, cylinders = 4)
# cat("Wheel check: ", subaru$wheels, "\n")
# cat("Door check: ", subaru$doors, "\n")
# cat("Cylinder check: ", subaru$cylinders, "\n \n")
# cat("Adding wheel directly to car object.", "\n")
# subaru$wheels = 5
# cat("Wheel check: ", subaru$wheels, "\n")
# cat("Door check: ", subaru$doors, "\n")
# cat("Cylinder check: ", subaru$cylinders, "\n \n")
# cat("Removing wheel using object method.", "\n")
# deleteWheels(subaru, 1)
# cat("Wheel check: ", subaru$wheels, "\n")
# cat("Door check: ", subaru$doors, "\n")
# cat("Cylinder check: ", subaru$cylinders, "\n")