#!/bin/bash

echo "Welcome to Snake and Ladder Simulator"

#CONSTANTS
START_POSITION=0
NO_PLAY=0
SNAKE=1
LADDER=2
WINNING_POSITION=100

#VARIABLE
dieCount=0

function rollingTheDie() {
	dieValue=$((RANDOM%6+1))
	((dieCount++))
}

function checkingNoPlayOrLadderOrSnake() {
	case $((RANDOM%3)) in
		$NO_PLAY)
			player=$1
			echo $player
			;;
		$SNAKE)
			player=$(($1 - $2))
			restartsToZeroOrTillExactWinningPosition -lt 0 +
			echo $player
			;;
		$LADDER)
			player=$(($1 + $2))
			restartsToZeroOrTillExactWinningPosition -gt 100 -
			echo $player
			;;
	esac
}

function restartsToZeroOrTillExactWinningPosition() {
	if [ $player $1 $2 ]
	then
		player=$(($currentPosition $3 $dieValue))
	fi
}

function startGame() {
	player1=0
	player2=0
	currentPlayer=-1
	SWITCH=-1
	while [[ $player1 -ne $WINNING_POSITION && $player2 -ne $WINNING_POSITION ]]
	do
		if [ $currentPlayer -eq -1 ]
		then
			rollingTheDie
			player1=$(checkingNoPlayOrLadderOrSnake $player1 $dieValue)
			if [ $player1 -eq $WINNING_POSITION ]
			then
				echo "Player 1 Wins"
			fi
		else
			rollingTheDie
			player2=$(checkingNoPlayOrLadderOrSnake $player2 $dieValue)
			if [ $player2 -eq $WINNING_POSITION ]
			then
				echo "Player 2 Wins"
			fi
		fi
		currentPlayer=$(($currentPlayer*$SWITCH))
	done
}
startGame
