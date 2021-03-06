%% Transformations
% This week we'll be talking about transformations, both
% linear and rotational. Before we begin, let's review what
% a transformation consists of.

% A transformation is a function that takes in a point
% oriented in space, and returns a new point, with possibly
% a different orientation, at a possibly different location.
% Most people are familiar with three types of
% transformations from grade school: rotations, reflections,
% and translations. We'll be focusing on rotations and
% translations.

%% Translations
% A translation is a function that takes in a position and
% returns a new position. We'll consider each position
% defined by a vector that extends from the origin to the
% point. Translations move every point by the same distance;
% you can think of this as adding a vector to each point.
% There are other transformations that scale vectors, but
% these are no good since points further from the origin get
% moved further.

points1 = [0.2 1 2; 1 0.8 2.7]; % column vector of initial points
translation = [0.5; 0.5]; % define translation
T = 'r - .'; % plotting style
hold on
plotv(points1, T);
T(1) = 'b';
plotv(translate(points1, translation), T);

%% Rotations
% Rotations are where things get a bit more interesting.
% Let's take a look at a typical rotation matrix for
% rotating a 2D vector. To find the values for a rotation
% matrix, you first need to specify the angle you want to
% rotate by. Positive angles result in anti-clockwise
% rotation.

angle = -11*pi/23; % specify the angle
hold off
T(1) = 'r';
plotv(points1, T);
hold on
T(1) = 'b';
plotv(rotate(points1, angle), T);

%% Transformations
% We can think of any function that reorients a set of
% points as a sequence of rotations and translations. To
% make things simple, we first translate the points to where
% they're supposed to go with one transformation, then spend
% another transformation rotating these points in space. If
% we're in 2D, we need a grand total of 4 parameters. If
% we're in 3D, we need 6. However, this makes doing inverse
% kinematics hard because we're trying to solve for so many
% dependent variables at once. It would be easier if we
% could represent such a transformation with fewer
% variables.

%% Denavit–Hartenberg Parameters
% This is a set of 4 parameters that define transformations
% between the joints of a robot. They take advantage of the
% fact that the robot limbs are rigid, which lets us
% eliminate 1 translation variable and 1 rotation variable.
% We just reduced the size of our matrix from 6x6 to 4x4,
% halving it and then some.

%% Important properties of DH Transformation
% 1. The origin of each reference frame is always located along
% the joint's axis of rotation
% 2. The translation between reference frames is always in a
% direction orthogonal to both axes of rotation - this means
% we only need to rotate along a single axis before
% translating our coordinate frame. (Which axis is that?)
% 3. The x-axis of the previous coordinate frame is
% perpendicular to the z-axis of the new one.