#!/usr/bin/python
#encoding:utf-8

import rospy
import RPi.GPIO as GPIO                    #Import GPIO library
import time                                #Import time library
GPIO.setmode(GPIO.BCM)                     #Set GPIO pin numbering
from sensor_msgs.msg import Range
from can_msgs.msg import Frame
import numpy as np

TRIG_FL= 15                                  #Associate pin 15 to TRIG
ECHO_FL = 14                                  #Associate pin 14 to Echo

TRIG_FR = 23                                  #Associate pin 15 to TRIG
ECHO_FR = 24                                  #Associate pin 14 to Echo

print "Distance measurement in progress"

GPIO.setup(TRIG_FL,GPIO.OUT)                  #Set pin as GPIO out
GPIO.setup(ECHO_FL,GPIO.IN)                   #Set pin as GPIO in

GPIO.setup(TRIG_FR,GPIO.OUT)                  #Set pin as GPIO out
GPIO.setup(ECHO_FR,GPIO.IN)                   #Set pin as GPIO in

rospy.init_node('USSROSnode')

sonar_pub_fl = rospy.Publisher('/sonar/front/left', Range, queue_size=50)
sonar_pub_fr = rospy.Publisher('/sonar/front/right', Range, queue_size=50)
CAN_publisher = rospy.Publisher('/can_tx', Frame, queue_size=50)
count = 0
r = rospy.Rate(1.0)

sonar = Range()
pulse_start =0
CAN_frame = Frame()

def CalculateDistance():
  GPIO.output(TRIG_FL, False)                 #Set TRIG as LOW
  GPIO.output(TRIG_FL, True)                  #Set TRIG as HIGH
  time.sleep(0.00001)                      #Delay of 0.00001 seconds
  GPIO.output(TRIG_FL, False)                 #Set TRIG as LOW
  pulse_start = time.time()
  while GPIO.input(ECHO_FL)==0:               #Check if Echo is LOW
    pulse_start = time.time()              #Time of the last  LOW pulse

  while GPIO.input(ECHO_FL)==1:               #Check whether Echo is HIGH
    pulse_end = time.time()                #Time of the last HIGH pulse 

  pulse_duration = pulse_end - pulse_start #pulse duration to a variable

  distance_fl = pulse_duration * 17150        #Calculate distance
  distance_fl = round(distance_fl, 2)            #Round to two decimal points

  GPIO.output(TRIG_FR, False)                 #Set TRIG as LOW
  GPIO.output(TRIG_FR, True)                  #Set TRIG as HIGH
  time.sleep(0.00001)                      #Delay of 0.00001 seconds
  GPIO.output(TRIG_FR, False)                 #Set TRIG as LOW

  while GPIO.input(ECHO_FR)==0:               #Check if Echo is LOW
    pulse_start = time.time()              #Time of the last  LOW pulse

  while GPIO.input(ECHO_FR)==1:               #Check whether Echo is HIGH
    pulse_end = time.time()                #Time of the last HIGH pulse 

  pulse_duration = pulse_end - pulse_start #pulse duration to a variable

  distance_fr = pulse_duration * 17150        #Calculate distance
  distance_fr = round(distance_fr, 2)            #Round to two decimal points
  
  return distance_fl , distance_fr



while True:
  current_time = rospy.Time.now()
  distance_fl , distance_fr = CalculateDistance()
  print(distance_fl , distance_fr)
  #if distance > 20 and distance < 400:     #Is distance within range
  #  print "Distance:",distance - 0.5,"cm"  #Distance with calibration
  #else:
  #  print "Out Of Range"                   #display out of range
  sonar.field_of_view = .349
  sonar.radiation_type = 1
  sonar.header.frame_id = 'sonar_left'
  sonar.header.stamp = current_time
  sonar.min_range = .020
  sonar.max_range = 3
  sonar.range = distance_fl/100
  sonar_pub_fl.publish(sonar)
  sonar.field_of_view = .349
  sonar.radiation_type = 1
  sonar.header.frame_id = 'sonar_right'
  sonar.header.stamp = current_time
  sonar.min_range = .020
  sonar.max_range = 3
  sonar.range = distance_fr/100
  sonar_pub_fr.publish(sonar)
  
  CAN_frame.header.stamp = current_time
  CAN_frame.id = 0x177
  CAN_frame.header.frame_id = 'USS'
  
  CAN_frame.data = [0x00,np.uint8(distance_fl),np.uint8(distance_fr),0x00,0x00,0x00,0x00,0x00]
  CAN_frame.is_rtr = False;
  CAN_frame.is_extended = False;
  CAN_frame.is_error = False;
  CAN_frame.dlc = 8;
  CAN_publisher.publish(CAN_frame)                    
 
