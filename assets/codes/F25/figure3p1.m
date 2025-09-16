% FIGURE3P1  Minimally reproduce Figure 3.1 from Trefethen and Bau.
% This code skips the annotations, so it is reasonably short and
% clear, I hope.  Please read it to understand the simple (and brute
% force?) approach.

A = [1 2; 0 2];
p = [1, 2, Inf];

% plot unit balls a point at a time, with axes
for k = 1:3
    subplot(3, 2, 2*(k-1) + 1)              % left column of subplots
    plot([-1.5 1.5], [0 0], 'k'),  hold on  % x axis
    plot([0 0], [-1.5 1.5], 'k')            % y axis
    for theta = 0:pi/200:2*pi
        x = [cos(theta); sin(theta)];
        x = x / norm(x, p(k));
        plot(x(1), x(2), '.k')
    end
    plot(1, 0, 'ok', 'markersize', 7)
    plot(0, 1, '.k', 'markersize', 16)
    axis off
    axis equal
end

% plot output shapes by applying A to the same points
for k = 1:3
    subplot(3, 2, 2*k)                      % right column of subplots
    plot([-2.5 2.5], [0 0], 'k'),  hold on
    plot([0 0], [-2.2 2.2], 'k')
    for theta = 0:pi/200:2*pi
        x = [cos(theta); sin(theta)];
        x = x / norm(x, p(k));
        y = A * x;
        plot(y(1), y(2), '.k')
    end
    plot(1, 0, 'ok', 'markersize', 7)
    plot(2, 2, '.k', 'markersize', 16)
    axis off
    axis equal
end
