terraform {

}

variable "hello" {
  type = string
}


# Collections

# List: a sequence of values identified by consecutive whole numbers starting with zero.
# Every element is the same type. 
variable "worlds" {
  type    = list(any)
  default = ["a", "b", "c", "d"]
}

# Map: a collection of values where each is identified by a string label.
# It is unordered
# Every element must be of the same type.
# Example:
# { "foo": "bar", "bar": "baz" }
# { foo = "bar", bar = "baz" }
variable "map-example" {
  type = map(any)
  default = {
    "name" : "Luks",
    "age" : "10",
    "gender" : "male"
  }
}

# Set: a collection of unique values, no secondary identifiers and ordering.
# No index or Key
# Individual item cannot be accessed
# Need to operate on the whole set using for_each, for example
variable "continents" {
  type = set(string)
  default = [
    "Asia", "Africa", "Europe", "Antarctica", "South America", "North America", "Australia/Oceania"
  ]
}

variable "worlds_splat" {
  type = list(any)
}


# Structural types

# Object: A map of dissimilar values, requires a schema
# Schema: { <KEY> = <TYPE>, <KEY> = <TYPE>, ... }
# To access:
# var.object-example
# var.object-example[*] (splat, entirely attributes)
# var.object-example.age
variable "object-example" {
  type = object({
    #Schema
    name   = string
    age    = number
    gender = optional(string)
  })
  default = {
    name   = "Luks"
    age    = 10
    gender = "male"
  }
}

# Tuple: A list with dissimilar types
# Schema: [<TYPE>, <TYPE>, ...]
# Access:
# var.tuple-example
# var.tuple-example[*]
# var.tuple-example[0]
variable "tuple-example" {
  type = tuple([string, number, string])
  default = [ "Luks", 10, "male" ]
}