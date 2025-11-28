terraform {

}

variable "planets" {
  type    = list(any)
  default = ["mar", "earth", "moon"]
}

variable "plans" {
  type = map(any)
  default = {
    "PlanA" = "10 USD"
    "PlanB" = "50 USD"
    "PlanC" = "100 USD"
  }
}


variable "plan" {
  type = object({
    PlanName   = string
    PlanAmount = number
  })

  default = {
    "PlanName"   = "Basic"
    "PlanAmount" = 10
  }
}


variable "random" {
  type = tuple([string,number,bool  ])
  default = [ "hello", 25, false ]
}

