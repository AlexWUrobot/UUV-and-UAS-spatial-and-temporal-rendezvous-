clc; 
clear all;
close all;

% MATLAB script to draw a 50x40 point plot and animate an agent moving
% from (0,0) to (50,40) using a Boustrophedon pattern with two circles

% Define the grid size
gridWidth = 50;
gridHeight = 40;

% Define the radius and colors of the circles
radius1 = 5;
color1 = 'y'; % green
radius2 = 10;
color2 = 'g'; % blue

% Initialize the figure
figure;
hold on;
axis([0 gridWidth 0 gridHeight]);
xlabel('X (miles)');
ylabel('Y (miles)');
title('Unmanned Underwater Vehicle (UUV) Presence Possibilty');

% Draw the grid
for i = 0:gridWidth
    plot([i i], [0 gridHeight], 'k:'); % vertical lines
end
for j = 0:gridHeight
    plot([0 gridWidth], [j j], 'k:'); % horizontal lines
end

% Initialize the agent position
agent = plot(0, 0, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% Function to plot circles
plot_circle = @(x, y, r, color) rectangle('Position', [x-r, y-r, 2*r, 2*r], ...
                                          'Curvature', [1, 1], ...
                                          'LineWidth', 3, ...
                                          'EdgeColor', color);

% Initialize the circles
circle1 = plot_circle(0, 0, radius1, color1);
circle2 = plot_circle(0, 0, radius2, color2);

% Initialize the path
pathX = [];
pathY = [];

% Initialize time
time = 0;

% Boustrophedon path generation and animation
for y = 0:gridHeight-1
    if mod(y, 2) == 0
        % Even row: move right
        for x = 0:gridWidth-1
            pathX = [pathX, x];
            pathY = [pathY, y];
            set(agent, 'XData', x, 'YData', y);
            set(circle1, 'Position', [x-radius1, y-radius1, 2*radius1, 2*radius1]);
            set(circle2, 'Position', [x-radius2, y-radius2, 2*radius2, 2*radius2]);
            time = time + 0.01;
            title(sprintf('Unmanned Underwater Vehicle (UUV) Presence Possibilty\nTime: %.2f hours', time));
            pause(0.01); % Adjust the pause duration to control the animation speed
        end
    else
        % Odd row: move left
        for x = gridWidth-1:-1:0
            pathX = [pathX, x];
            pathY = [pathY, y];
            set(agent, 'XData', x, 'YData', y);
            set(circle1, 'Position', [x-radius1, y-radius1, 2*radius1, 2*radius1]);
            set(circle2, 'Position', [x-radius2, y-radius2, 2*radius2, 2*radius2]);
            time = time + 0.01;
            title(sprintf('Unmanned Underwater Vehicle (UUV) Presence Possibilty\nTime: %.2f hours', time));
            pause(0.01);
        end
    end
end

% Move to the final point (50, 40)
pathX = [pathX, gridWidth];
pathY = [pathY, gridHeight-1];
set(agent, 'XData', gridWidth, 'YData', gridHeight-1);
set(circle1, 'Position', [gridWidth-radius1, gridHeight-1-radius1, 2*radius1, 2*radius1]);
set(circle2, 'Position', [gridWidth-radius2, gridHeight-1-radius2, 2*radius2, 2*radius2]);
time = time + 0.01;
title(sprintf('Unmanned Underwater Vehicle (UUV) Presence Possibilty\nTime: %.2f seconds', time));

% Plot the final path
plot(pathX, pathY, 'b-');

hold off;
