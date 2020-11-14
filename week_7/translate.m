function [points] = translate(points, translation)
% TRANSLATE moves a set of points
% Takes in an initial state and a translation vector and
% returns their sum
[~, numCol] = size(points);
points = points + repmat(translation, 1, numCol);
end

