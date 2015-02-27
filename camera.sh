#!/bin/bash
#This internally sets the gpio pin to be an output pin.
sudo /usr/local/bin/gpio mode 0 out
#This turns the gpio pin 0 to 3.3 volts relative the ground.
sudo /usr/local/bin/gpio write 0 1
#This sleeps the Pi for .25 seconds before taking the photo.
sleep 0.25
#This takes the photo, horizontal and vertical flip, saves in camera folder
raspistill  -o /home/pi/camera/$(date +"%Y-%m-%d_%H%M%S")nusinowlab.jpg -vf -hf -ex auto -mm backlit -q 75 -awb auto -ev +3
#Pi sleeps for another .25 seconds after photo is taken
sleep 0.25
#This turns the gpio pin 0 back to ground level (0.0 Volts)
sudo /usr/local/bin/gpio write 0 0
