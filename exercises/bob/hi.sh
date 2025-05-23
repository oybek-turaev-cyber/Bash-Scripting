#!/bin/bash
x="What are you doing?"

[[ "$x" =~ ^[WH].*\?$ ]] && echo "You got it"
