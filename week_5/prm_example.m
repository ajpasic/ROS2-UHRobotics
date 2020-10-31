% load image as logical array
bwimage = imread('MAZE.png');
% convert logical array to occupancy grid with 1:1 resolution
map = binaryOccupancyMap(bwimage);

% "inflate" the map to account for robot dimensions
robotRadius = 0.01;
mapInflated = copy(map);
inflate(mapInflated, robotRadius);

% create a prm object and set its parameters
prm = mobileRobotPRM;
prm.Map = mapInflated;
prm.NumNodes = 20000; % number of nodes
prm.ConnectionDistance = 100; % max distance between connected nodes

% define start and end points
startLocation = [4 1800];
endLocation = [1800 4];

% run prm algorithm
path = findpath(prm, startLocation, endLocation);
show(prm)