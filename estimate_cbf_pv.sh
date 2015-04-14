#!/bin/bash
datafile=$1

# Use basil to do model fitting
basil -i $datafile -m mask -o output --infertau --infert1 --inferart --pgm pvgm --pwm pvwm -@ basil_pv_simulation_options.txt 

# Rescale and mask GM CBF
fslmaths pvgm -bin gm_mask
fslmaths ./output/step4/mean_ftiss -mul 6000 -div 0.91 -mas gm_mask estimated_cbf_gm

# Rescale and mask WM CBF
fslmaths pvwm -bin wm_mask
fslmaths ./output/step4/mean_fwm -mul 6000 -div 0.91 -mas wm_mask estimated_cbf_wm

echo 'Finish'