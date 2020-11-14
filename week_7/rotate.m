function [points] = rotate(points, angle)
% ROTATE rotates a set of points by an angle
% Takes in a set of columnwise points and a rotation matrix,
% returns their product
rotation = [cos(angle) -sin(angle); sin(angle) cos(angle)];
points = mtimes(rotation, points);
end

