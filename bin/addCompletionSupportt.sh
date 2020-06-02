#!/bin/bash

SHELL_TYPE=$SHELL
pattern=".*bash.*"
echo "Installing 1...${SHELL_TYPE}"

if [[ $SHELL_TYPE =~ $pattern ]]; then
  echo "Installing 2...${SHELL_TYPE}"
	echo "source ##PREFIX##/bin/ol-completion.sh" >> ~/.bash_profile
	source ~/.bash_profile
fi

