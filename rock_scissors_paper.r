score <- 0
rounds <- 0

while (TRUE) {


  
print("Please enter your move '1' = Rock, '2' = Paper, '3' = Scissors or '0' for exit")

player <- readLines("stdin", n= 1)
bot <- sample(1:3, size = 1)
  if(player==0){
    break
  }
  if(player == 1){
    if(bot == 1){
        score <- score + 0
        print("Rock beats Rock")
        print("It's tie!")
      } else if(player == 1){
      if(bot == 2){
        score <- score + 0
        print("Rock beats Paper")
        print("You lose!")
      }
      } else if(player == 1){
      if(bot == 3){
        score <- score + 1
        print("Rock beats Scissors")
        print("You win!")
      }
  } 
} else if(player == 2){
      if(bot == 1){
      score <- score + 1
      print("Paper beats Rock")
      print("You win!")
      } else if(player == 2){
      if(bot == 2){
      score <- score + 0
      print("Paper beats Paper")
      print("It's tie!")
      }
      } else if(player == 2){
      if(bot == 3){
      score <- score + 0
      print("Paper beats Scissors")
      print("You lose!")
      }
  }
} else if(player == 3){
      if(bot == 1){
      score <- score + 0
      print("Scissors beats Rock")
      print("You lose!")
      } else if(player == 3){
      if(bot == 2){
      score <- score + 1
      print("Scissors beats Paper")
      print("You Win!")
      }
      } else if(player == 3){
      if(bot == 3){
      score <- score + 0
      print("Scissors beats Scissors")
      print("It's tie!")
      }
  }
} else {
        print("Invalid Move. Please enter '1' = Rock, '2' = Paper, '3' = Scissors or '0' for exit")
}
        rounds <- rounds + 1
}

print(paste("Rounds plays:",rounds, " Summary scores:", score))
