# -*- coding: utf-8 -*-

# -- Sheet --

# # **Pao Ying Chub**
# - 1 = Rock
# - 2 = Paper
# - 3 = Scissors
# - 0 = Exit!


import random

print("Rock Scissors Paper")
print("You can play infinity times. Quit type '0'")
print("Please enter your move '1' = Rock, '2' = Paper, '3' = Scissors or '0' for exit")

player_wins = 0
bot_wins = 0
ties = 0

bot = random.choice([1, 2, 3])

while True:

    player = int(input("What is your move: "))

    if player == 0:
        print("Exit!")
        break

    print(f"Bot choose: {bot}")
    if player == bot:
        print("It's a tie!")
        ties += 1
    elif player == 1:
        if bot == 2:
            print("You lose!")
            bot_wins += 1
        elif bot == 3:
            print("You win!")
            player_wins += 1
    elif player == 2:
        if bot == 1:
            print("")
            player_wins += 1
        elif bot == 3:
            print("")
            bot_wins += 1
    elif  player == 3:
        if bot == 1:
            print("")
            bot_wins += 1
        elif bot == 2:
            print("")
            player_wins += 1
    else:
        print("Invalid input!")

print()
print(f"Player scores: {player_wins}")
print(f"Bot scores: {bot_wins}")
print(f"Ties scores: {ties}")

