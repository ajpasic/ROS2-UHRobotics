%exampleHelperROS2CreateSampleNetwork Create an example ROS 2 network
%   This network is representative of a realistic ROS 2 network and is used 
%   throughout the MATLAB ROS 2 examples. It features three nodes,
%   two publishers, three subscribers. Additionally we use a
%   timer to control publishing of ROS 2 messages over the network.
%
%   See also exampleHelperROS2ShutDownSampleNetwork, exampleHelperROSSimTimer,
%   exampleHelperROS2LoadRanges

%   Copyright 2019 The MathWorks, Inc.

% Initialize three nodes.

node_1 = ros2node("node_1");
node_2 = ros2node("node_2");
node_3 = ros2node("node_3");

% Create a publisher and subscriber for the '/pose' topic

twistPub = ros2publisher(node_1,'/pose','geometry_msgs/Twist');
twistPubmsg = ros2message(twistPub);
twistSub = ros2subscriber(node_2,'/pose');

% Create publishers and subscribers for the '/scan' topic
scanPub = ros2publisher(node_3,'/scan','sensor_msgs/LaserScan');
scanPubmsg = exampleHelperROS2LoadRanges();
scanSub1 = ros2subscriber(node_1,'/scan');
scanSub2 = ros2subscriber(node_2,'/scan');

% Create a timer for publishing messages and assign appropriate handles
% The timer will call exampleHelperROSSimTimer at a rate of 10 Hz.
timerHandles.twistPub = twistPub;
timerHandles.twistPubmsg = twistPubmsg;
timerHandles.scanPub = scanPub;
timerHandles.scanPubmsg = scanPubmsg;
simTimer = ExampleHelperROSTimer(0.1, {@exampleHelperROS2SimTimer,timerHandles});