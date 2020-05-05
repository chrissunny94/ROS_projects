cmake_minimum_required(VERSION 2.8.3)
project(ace_uss)
## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  roscpp
  geometry_msgs
  sensor_msgs
  std_msgs
  ackermann_msgs
  tf_conversions
   tf
        socketcan_interface
        can_msgs

)



###################################
## catkin specific configuration ##
###################################


###########
## Build ##
###########

include_directories(
  
  ${catkin_INCLUDE_DIRS}
 
)
catkin_package(
        INCLUDE_DIRS
        LIBRARIES
        CATKIN_DEPENDS
        can_msgs
        roscpp
        socketcan_interface
        ackermann_msgs
)


