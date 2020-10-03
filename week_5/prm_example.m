% load image as logical array
image = imread('UH.png');
bwimage = image > 10;
% convert logical array to occupancy grid with 1:1 resolution
map = binaryOccupancyMap(bwimage, 1);

% "inflate" the map to account for robot dimensions
robotRadius = 0.2;
mapInflated = copy(map);
inflate(mapInflated, robotRadius);

% create a prm object and set its parametrs
prm = mobileRobotPRM;
prm.Map = mapInflated;
prm.NumNodes = 2000; % number of nodes
prm.ConnectionDistance = 10; % max distance between connected nodes

% define start and end points
startLocation = [1 1];
endLocation = [324 140];

% run prm algorithm
path = findpath(prm, startLocation, endLocation);
show(prm)
