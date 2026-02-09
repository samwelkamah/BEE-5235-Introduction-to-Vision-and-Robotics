clc; clear; close all;

p = [7; 4; 1.5];

% choose one:
R = eye(3);                 % Option A: E axes parallel to A axes
% R = diag([-1 -1 1]);      % Option B: ex=-xA, ey=-yA, ez=+zA

TAE = [R p; 0 0 0 1];

disp('^A T_E ='); disp(TAE);

ex = R(:,1); ey = R(:,2); ez = R(:,3);
fprintf('||ex×ey - ez|| = %.3e\n', norm(cross(ex,ey)-ez));
fprintf('det(R) = %.3f\n', det(R));

figure('Color','w'); hold on; grid on; axis equal;
xlabel('X'); ylabel('Y'); zlabel('Z'); view(35,25);

drawFrame([0;0;0], eye(3), 1.0, 'A');
drawFrame(p, R, 1.0, 'E');
title('Exercise 3: Frames A and E');

function drawFrame(o, R, s, name)
    x = o + s*R(:,1);
    y = o + s*R(:,2);
    z = o + s*R(:,3);

    plot3([o(1) x(1)], [o(2) x(2)], [o(3) x(3)], 'LineWidth', 2);
    plot3([o(1) y(1)], [o(2) y(2)], [o(3) y(3)], 'LineWidth', 2);
    plot3([o(1) z(1)], [o(2) z(2)], [o(3) z(3)], 'LineWidth', 2);

    text(o(1), o(2), o(3), ['  ' name], 'FontWeight','bold');
    text(x(1), x(2), x(3), [name '_x']);
    text(y(1), y(2), y(3), [name '_y']);
    text(z(1), z(2), z(3), [name '_z']);
end
