#!/bin/sh

for i in {1..420}
do
	mv points_blue_${i} blue_temp.dat
    mv points_red_${i} red_temp.dat
    mv Nblue_${i} Nblue_temp.dat
    mv Nred_${i} Nred_temp.dat
	cp points_template.pov frame_${i}.pov
   	povray -V +A0.0 +H1200 -J +R5 +W1600 frame_${i}.pov
   	rm -f frame_${i}.pov
   	rm -f blue_temp.dat
    rm -f red_temp.dat
    rm -f Nblue_temp.dat
    rm -f Nred_temp.dat
done
