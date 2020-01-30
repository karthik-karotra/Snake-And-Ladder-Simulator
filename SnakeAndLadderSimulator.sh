#!/bin/bash -x
echo "Welcome to Snake and Ladder Simulator"

#CONSTANTS
NO_OF_PLAYERS=1
START_POSITION=0

function rollingTheDie() {
	dieValue=$((RANDOM%6+1))
	echo "Die number generated is $dieValue"
}
rollingTheDie
