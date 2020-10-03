# Agenda
1. Review last week's info
2. Check progress on spiral motion task
3. Introduce Occupancy Grids

## Occupancy Grids
Occupancy grids are the simplest way to represent an environment, or *workspace*. Occupancy grids simplify workspaces as a discrete set of squares, which are either free or occupied. Occupancy grids are not always binary; sometimes the probability that a square is empty is used instead.

Occupancy grids are a memory-efficient way to store information about a workspace, and are useful in real-time mapping, localization, and planning algorithms. Mapping refers to the process of determining which squares are free and which are empty. Localization is the process by which a robot orients itself relative to the workspace, and identifies where it is. Planning is done after both mapping and localization are completed. If a robot needs to get somewehere, it must first define where it is, where it's going, and where it can go.

The Robotics System Toolbox has built-in support for occupancy grids. You can create an binary occupancy grid with the command
```
map = binaryOccupancyMap(width, height, resolution)
```
The parameters *width* and *height* define the dimensions of the occupancy grid in meters. The *resolution* defines the number of cells per meter. The resolution is identical for both axes. If no resolution is supplied, it is assumed to be 1. If no dimensions are supplied, they default to 10 x 10.

You can set cells of the occupancy grid to be free or occupied with
```
setOccupancy(map, xy, val)
```
where *map* is the occupancy grid you are setting values for, *xy* is a columnwise array of xy coordinates, and *val* is either a scalar or a set of values with the same number of rows as xy.

MATLAB occupancy grids support both relative and absolute coordinate frames, which are known as *local* and *world*. You can move the local frame with
```
move(map, moveValue)
```
where *moveValue* is either the absolute position you want to move the local origin to, or a relative offset applied to the current local origin. You can run the command `openExample('nav_robotics/MoveLocalMapAndSyncWithWorldMapExample')` to see an example of relative offsets and their use in waypoint following.

You can also create an occupancy grid from an image.
```
img = imread('UH.png')
grayimage = rgb2gray(image);
bwimage = grayimage < 0.5;
grid = binaryOccupancyMap(bwimage);
show(grid)
```
The threshold of 0.5 determines which cells in the resulting occupancy grid are occupied.

Now run the command `openExample('robotics/PathFollowingControllerExample')` to see how path planning algorithms utilize the well-defined workspaces that occupancy grids provide.
