#!/bin/bash 
echo "Welcome to Snake and Ladder Simulator"

#CONSTANTS
NO_OF_PLAYERS=1
START_POSITION=0
NO_PLAY=0
SNAKE=1
LADDER=2
WINNING_POSITION=100

currentPosition=0

function rollingTheDie() {
	dieValue=$((RANDOM%6+1))
	echo "Die number generated is $dieValue"
	checkingNoPlayOrLadderOrSnake
}

function checkingNoPlayOrLadderOrSnake() {
	case $((RANDOM%3)) in
		$NO_PLAY)
			echo "There's no progress in your position" 
			currentPosition=$currentPosition
			echo $currentPosition
			;;
		$SNAKE)
			echo "OOPS!!!You were eaten by a snake"
			currentPosition=$(($currentPosition - $dieValue))
			restartsToZero
			echo $currentPosition
			;;
		$LADDER)
			echo "Yeah!! You just climb a ladder"
			currentPosition=$(($currentPosition + $dieValue))
			echo $currentPosition
			;;
	esac
}

function restartsToZero() {
	if [ $currentPosition -lt 0 ]
	then
		currentPosition=$(($currentPosition + $dieValue))
	fi
}

while [ $currentPosition -ne $WINNING_POSITION ]
do
	rollingTheDie
done
