#!/bin/bash

#Launch publisher and subscriber node with cleanup hand 
cleanup() {
    echo "Restarting ROS2 daemon to cleanup before shutting down all processes..."
    ros2 daemon stop
    sleep 1
    ros2 daemon start
    echo "Terminating all ROS2 related processes..."
    kill 0
    exit
}


trap 'cleanup' SIGINT

# Launch the publisher Node
ros2 run ros2_fundamentals_examples py_minimal_publisher.py &

sleep 2

# Launch the subscriber Node
ros2 run ros2_fundamentals_examples py_minimal_subscriber.py
