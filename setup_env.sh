#!/bin/bash

# create a .env file from the terminal
touch .env

# pass all the variables into the .env file from the CI
echo API_KEY=$API_KEY >> .env