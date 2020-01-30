#!/bin/bash -x
echo "Welcome to Snake and Ladder Simulator"

#CONSTANTS
NO_OF_PLAYERS=1
START_POSITION=0
NO_PLAY=0
SNAKE=1
LADDER=2

currentPosition=0

function rollingTheDie() {
	dieValue=$((RANDOM%6+1))
	echo "Die number generated is $dieValue"
	checkingNoPlayOrLadderOrSnake
}

function checkingNoPlayOrLadderOrSnake() {
	case $((RANDOM%3)) in
		$NO_PLAY) 
			currentPosition=$currentPosition
			;;
		$SNAKE)
			currentPosition=$(($currentPosition - $dieValue))
			;;
		$LADDER)
			currentPosition=$(($currentPosition + $dieValue))
			;;
	esac
}
rollingTheDie

