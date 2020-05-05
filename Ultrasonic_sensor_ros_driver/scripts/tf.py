#!/usr/bin/env python

import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Quaternion, Pose, Point, Vector3
from std_msgs.msg import Header, ColorRGBA


POINTS= Point
marker_publisher = rospy.Publisher('visualization_marker', Marker, queue_size=5)
def wait_for_time():                                              
    """Wait for simulated time to begin.                          
    """                                                           
    while rospy.Time().now().to_sec() == 0:                       
        pass

def show_text_in_rviz(marker_publisher, text):
   
    marker = Marker(
                type=Marker.LINE_STRIP
                ,id=0,
                lifetime=rospy.Duration(1.5),
                pose=Pose(Point(0, 0, 0), Quaternion(0, 0, 0, 1)),
                scale=Vector3(0.06, 0.06, 0.06),
                header=Header(frame_id='base_link'),
                color=ColorRGBA(0.0, 1.0, 0.0, 0.8),
                )
    marker.points.append(Point(4,1,0.3))
    marker.points.append(Point(4,-1,0.3))
    marker_publisher.publish(marker)

def main():
  rospy.init_node('my_node')
  wait_for_time()
  
  show_text_in_rviz(marker_publisher, 'Hello world!')

if __name__ == '__main__':
    while True:
        main()