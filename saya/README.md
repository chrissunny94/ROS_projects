# Gazebo ROS Demos

* Author: Chris Sunny Thaliyath <chrissunny94@gmail.com>
* License: GNU General Public License, version 3 (GPL-3.0)


## Tutorials

[ROS URDF](http://gazebosim.org/tutorials/?tut=ros_urdf)

## Quick Start

Rviz:

    roslaunch saya_description saya_rviz.launch

Gazebo:

   roslaunch saya_gazebo saya.launch

ROS Control:

    roslaunch saya_control saya_control.launch

Example of Moving Joints:

    rostopic pub /saya/joint2_position_controller/command std_msgs/Float64 "data: -0.9"

[![Demo](https://j.gifs.com/jqNo2W.gif)](https://www.youtube.com/watch?v=NiagC6wMAwk)



For move_it integration 

    

	roslaunch saya_gazebo saya.launch

	roslaunch saya_moveit_config saya_moveit_planning_execution.launch sim:=true

	roslaunch saya_moveit_config moveit_rviz.launch config:=true

[![Move_it Demo](https://j.gifs.com/860R8o.gif)](https://www.youtube.com/watch?v=MSfFktNlBew&feature=youtu.be)

	

## Develop and Contribute

We welcome any contributions to this repo and encourage you to fork the project then send pull requests back to this parent repo. Thanks for your help!
