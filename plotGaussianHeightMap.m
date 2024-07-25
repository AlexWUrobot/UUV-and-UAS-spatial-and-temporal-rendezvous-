function plotGaussianHeightMap(x, y, z, sigma)
    % Check if the input arrays have the same length
    if length(x) ~= length(y) || length(y) ~= length(z) || length(z) ~= length(sigma)
        error('Input arrays x, y, z, and sigma must have the same length');
    end

    % Define the grid size
    xSize = 40;
    ySize = 50;

    % Create a grid for the x and y values
    [X, Y] = meshgrid(linspace(min(x)-3*max(sigma), max(x)+3*max(sigma), xSize), ...
                      linspace(min(y)-3*max(sigma), max(y)+3*max(sigma), ySize));

    % Initialize the Z values
    Z = zeros(size(X));

    % Calculate the Gaussian height map
    for i = 1:length(x)
        Z = Z + z(i) * exp(-((X - x(i)).^2 + (Y - y(i)).^2) / (2 * sigma(i)^2));
    end

    % Plot the 3D Gaussian height map
    figure;
    surf(X, Y, Z);
    shading interp;
    colormap jet;
    colorbar;
    title('3D Gaussian Height Map');
    xlabel('X-axis');
    ylabel('Y-axis');
    zlabel('Z-axis');
end
