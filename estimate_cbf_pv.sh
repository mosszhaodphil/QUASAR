#!/bin/bash
datafile=$1

# Use basil to do model fitting
basil -i $datafile -m mask -o output --infertau --infert1 --inferart --pgm pvgm --pwm pvwm -@ basil_pv_simulation_options.txt 

#rescale and mask
fslmaths ./output/step4/mean_ftiss -mul 6000 -div 0.91 -mas gm_mask estimated_cbf_mask

echo 'Finish'