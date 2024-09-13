function [rotateVideo, deg] = setRotation(flag, angle)
    % SETROTATION Sets the video rotation flag and angle.
    %
    % Usage:
    %   [rotateVideo, deg] = setRotation();
    %   [rotateVideo, deg] = setRotation(flag);
    %   [rotateVideo, deg] = setRotation(flag, angle);
    %
    % Inputs:
    %   flag  - (Optional) Logical value to enable/disable rotation (default: false).
    %   angle - (Optional) Rotation angle in degrees (default: 90 degrees).
    %
    % Outputs:
    %   rotateVideo - Logical value indicating if rotation is enabled.
    %   deg         - Rotation angle in degrees, or empty if rotation is disabled.
    %
    % Example:
    %   [rotateVideo, deg] = setRotation(true, 270);
    %   [rotateVideo, deg] = setRotation(false);
    %

    % Set default values if not provided
    if nargin < 1
        flag = false;  % Default flag is false
    end
    if nargin < 2
        angle = 90;    % Default angle is 90 degrees
    end

    % Validate the flag input
    if ~islogical(flag)
        error('Invalid input: flag must be true or false.');
    end

    % Main processing: Set rotation parameters
    if flag
        rotateVideo = true;
        deg = angle;
    else
        rotateVideo = false;
        deg = [];
    end
end
