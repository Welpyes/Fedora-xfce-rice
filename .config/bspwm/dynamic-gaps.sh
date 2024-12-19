#!/bin/bash

# Set desired gap values
MULTIPLE_GAPS=15
SINGLE_GAP=40

# Function to adjust gaps
dynamic_gaps() {
    # Get the current desktop ID
    local desktop=$(bspc query -D -d focused)

    # Count the number of windows on the current desktop
    local window_count=$(bspc query -N -d focused -n .window | wc -l)

    # Set the gap size based on the window count
    if [ "$window_count" -eq 1 ]; then
        bspc config -d "$desktop" window_gap $SINGLE_GAP
    else
        bspc config -d "$desktop" window_gap $MULTIPLE_GAPS
    fi
}

# Listen for events and call the function dynamically
bspc subscribe node_add node_remove node_transfer | while read -r _; do
    dynamic_gaps
done

