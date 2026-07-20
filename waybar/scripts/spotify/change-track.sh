#!/bin/bash

# follow metadata of spotify media to ensure live updates to title
playerctl --player=spotify metadata --format '{{title}}' --follow | while read title; do
    echo "{\"text\": \"$title\"}"
done