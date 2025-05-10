function [intersects, ix, iy] = segmentIntersection(x1, y1, x2, y2)
    % x1, y1: endpoints of the first line segment
    % x2, y2: endpoints of the second line segment
    intersects = false;
    ix = NaN;
    iy = NaN;

    % Line segment 1: (x1(1), y1(1)) to (x1(2), y1(2))
    % Line segment 2: (x2(1), y2(1)) to (x2(2), y2(2))
    denom = (x1(2) - x1(1)) * (y2(2) - y2(1)) - (y1(2) - y1(1)) * (x2(2) - x2(1));
    if abs(denom) < 1e-10
        return; % Parallel lines, no intersection
    end

    ua = ((x2(2) - x2(1)) * (y1(1) - y2(1)) - (y2(2) - y2(1)) * (x1(1) - x2(1))) / denom;
    ub = ((x1(2) - x1(1)) * (y1(1) - y2(1)) - (y1(2) - y1(1)) * (x1(1) - x2(1))) / denom;

    % Check if intersection occurs within the line segments
    if ua >= 0 && ua <= 1 && ub >= 0 && ub <= 1
        intersects = true;
        ix = x1(1) + ua * (x1(2) - x1(1));
        iy = y1(1) + ua * (y1(2) - y1(1));
    end
end