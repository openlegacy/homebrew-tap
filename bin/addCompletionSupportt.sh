#!/bin/bash

CURR_PATH="`pwd`"
SHELL_TYPE=$SHELL
pattern=".*bash.*"

if [[ $SHELL_TYPE =~ $pattern ]]; then
  echo "Installing...${SHELL_TYPE}"
	echo "source ##PREFIX##/bin/.ol-completion.sh" >> ~/.bash_profile
	source ~/.bash_profile
fi

