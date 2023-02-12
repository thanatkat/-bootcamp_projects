# homework 01
# chatbot (rule-base)
# ordering pizza

print("Welcome to our app!")
print("Hi There!")

print("What's your name?: ")
user_name <- readLines("stdin", n=1)
# n=1 รับ Input 1 บรรทัด
print(paste("Hi", user_name))

# question 02
print("What do you want to order today?")
print("1. order pizza, 2. exit")
action <- readLines("stdin", n= 1)
if (action == 1){
    print("Choose your topping")
    print("1. Pepperoni, 2. Mushrooms, 3.Bacon, 4. Extra Cheese")
    topping <- readLines("stdin", n=1)
    # Peperoni
    if (topping == 1) {
      topping <- "Pepperoni"
      print("Your topping is Pepperoni")
    }
    # Mushrooms
    else if  (topping == 2) {
      topping <- "Mushrooms"
      print("Your topping is Mushrooms")
    }
    # Bacon
    else if  (topping == 3) {
      topping <- "Bacon"
      print("Your topping is Bacon")
    }
    # Extra Cheese
    else if (topping == 4) {
      topping <- "Extra Cheese"
      print("Your topping is Extra Cheese")
    }
    # No order
    else {
    print("Please Try Again")
    }       
} else {
		print("Exit")
    quit()
  }
# question 03
# Crust
print("Choose your crust")
print("1. Thin Soft, 2. Cheese, 3. Pan")
crust <- readLines("stdin", n=1)
if (crust == 1){
  crust <- "Thin Soft Crust"
  print(paste("Thin Soft Crust with", topping))
} else if (crust == 2){
  crust <- "Cheese Crust"
  print(paste("Cheese Crust with", topping))
} else if (crust == 3){
  crust <- "Pan Crust"
  print(paste("Pan Crust with", topping))
} 

# question 04
# dipping
print("Choose your dipping")
print("1. Mayonnaise, 2. Tomato, 3. Galic")
dip <- readLines("stdin", n=1)
if (dip == 1){
  dip <- "Mayonnaise"
  print(paste(crust, topping,"with", dip))
} else if (dip == 2){
  dip <- "Tomato"
  print(paste(crust, topping,"with", dip))
} else if (dip == 3){
  dip <- "Galic"
  print(paste(crust, topping,"with", dip))
} 

# question 05
# size
print("Which size do you want")
print("1. S, 2. M, 3. L")
sizes <- readLines("stdin", n=1)
if (sizes == 1){
  sizes <- "S"
  print(paste(crust, topping,"with", dip, sizes))
} else if (sizes == 2){
  sizes <- "M"
  print(paste(crust, topping,"with", dip, sizes))
} else if (sizes == 3){
  sizes <- "L"
  print(paste(crust, topping,"with", dip, sizes))
}

# question 06
print("Quantity")
amount <- readLines("stdin", n=1)

# question 07
print("Do you want some drink?")
print("1. Yes, 2. No")
drink <- readLines("stdin", n=1)
if(drink == 1){
  print("1. Coke, 2. Lemonade, 3. Water")
  drinks <- readLines("stdin", n=1)
  if(drinks == 1){
    drinks <- "Coke"
    print("Your drink is Coca Cola")
  } else if (drinks == 2){
    drinks <- "Lemonade"
    print("Your drink is Lemonade")
  } else if (drinks == 3){
    drinks <- "Water"
    print("Your drink is Water")
  } else
    print("Please Try Again")
} else if (drink == 2){
  drinks <- "No Drink"
  print("No Drink")
}

# question 08
print("Confirm your order")
print("1. Yes, 2. No")
con <- readLines("stdin", n=1)
# summary
if (con == 1){
  print(paste("Your order:", crust, topping, dip, sizes, amount, "and", drinks))
} else if (con == 2){
  print("Please try again")
  quit()
}

# question 09
# payment
print("Select your payment method")
print("1. Credit Card, 2. Cash, 3. Scan QR Code")
pay <- readLines("stdin", n=1)
if (pay == 1){
  pay <- "Credit Card"
} else if (pay == 2){
  pay <- "Cash"
} else if (pay == 3){
  pay <- "Scan QR Code"
}
print(paste("Your payment medthod:", pay))
print("Thank you for your order.")
