#!/bin/bash

single_window_gap=130
multiple_windows_gap=15

window_count=$(bspc query -N -d focused -n .tiled | wc -l)

if [ "$window_count" -eq 1 ]; then
    bspc config left_padding "$single_window_gap"
    bspc config right_padding "$single_window_gap"
else
    bspc config left_padding "$multiple_windows_gap"
    bspc config right_padding "$multiple_windows_gap"
fi
