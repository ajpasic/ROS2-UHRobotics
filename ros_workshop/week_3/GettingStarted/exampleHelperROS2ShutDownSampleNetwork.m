%exampleHelperROS2ShutDownSampleNetwork Shut down the example ROS 2 network
%   This script shuts down the nodes, publishers and subscribers
%   created by exampleHelperROS2CreateSampleNetwork. 
%
%   See also exampleHelperROS2CreateSampleNetwork

%   Copyright 2019 The MathWorks, Inc.

% Clear timer object first
clear('simTimer');

% Shut down publishers and subscribers of the /scan topic
clear('scanPub');
clear('scanPubmsg');
clear('scanSub1');
clear('scanSub2');

% Shut down publishers and subscribers of the /pose topic
clear('twistPub');
clear('twistPubmsg');
clear('twistSub');

% Finally, shut down the three nodes
clear('node_1');
clear('node_2');
clear('node_3');

% Delete data variables
clear('timerHandles');
