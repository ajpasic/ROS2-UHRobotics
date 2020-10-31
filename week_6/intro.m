%% simple visualization
viz = Visualizer2D;
pose = [2; 3; pi/3]; % set position and orientation
viz(pose);
%% adding waypoints
release(viz);
viz.hasWaypoints = true;
waypoints = [0 0; 1 1; 2 2; 3 3];
viz(pose, waypoints);
%% update robot pose
pose = [2; 3; pi/3];
viz(pose, waypoints);
for idx = 1:10
  pose = pose + rand(3, 1);
  viz(pose, waypoints);
  pause(0.25);
end
%% occupancy grid
load exampleMap;
release(viz);
viz.showTrajectory = false;
viz.mapName = 'map';
viz.hasWaypoints = false;
viz(pose);
%% lidar sensor
pose = [3; 4; 0];
release(viz);
lidar = LidarSensor;
lidar.scanAngles = linspace(-pi/2, pi/2, 7);
attachLidarSensor(viz, lidar);
for idx = 1:10
  pose = pose + [0; 0; pi/10];
  ranges = lidar(pose);
  viz(pose, ranges);
  pause(1);
end
%% object detection
clear; clc;
viz = Visualizer2D;
viz.showTrajectory = false;
detector = ObjectDetector;
attachObjectDetector(viz, detector);
objects = [1, 1, 1; 0, 1, 2; 1, 0, 3];
viz.objectColors = [1, 0, 0; 0, 1, 0; 0, 0, 1];
pose = [0;0;0];
viz(pose, objects);
xlim([-2, 2]);
ylim([-2, 2]);
% spin around and display object detections
for idx = 1:30
  pose = pose+ [0; 0; pi/16];
  detections = detector(pose, objects);
  disp(detections);
  viz(pose, objects);
  pause(2);
end

