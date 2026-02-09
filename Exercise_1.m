clc; clear; close all;

xA2 = [1;0;0];
yA2 = [0;-1;0];
zA2 = cross(xA2,yA2);

xA1 = [1;0;0];
yA1 = [-1;-1;0]; yA1 = yA1/norm(yA1);
zA1 = cross(xA1,yA1);

fprintf("A2: z = [%g %g %g]^T  => %s\n", zA2, inOut(zA2(3)));
fprintf("A1: z = [%g %g %g]^T  => %s\n", zA1, inOut(zA1(3)));

tiledlayout(1,2,'Padding','compact','TileSpacing','compact');

nexttile; draw2D(xA2(1:2), yA2(1:2), zA2(3)); title('Frame A2');
nexttile; draw2D(xA1(1:2), yA1(1:2), zA1(3)); title('Frame A1');

exportgraphics(gcf,'ex1_frames.png','Resolution',200);

function s = inOut(z)
    if z > 0, s = "out of page (⊙)"; else, s = "into page (⊗)"; end
end

function draw2D(xv, yv, z)
    hold on; grid on; axis equal;
    quiver(0,0,xv(1),xv(2),0,'LineWidth',2);
    quiver(0,0,yv(1),yv(2),0,'LineWidth',2);
    text(xv(1)*1.08,xv(2)*1.08,'x','FontSize',12);
    text(yv(1)*1.08,yv(2)*1.08,'y','FontSize',12);
    if z > 0
        text(0.05,0.05,'⊙  z','FontSize',13,'FontWeight','bold');
    else
        text(0.05,0.05,'⊗  z','FontSize',13,'FontWeight','bold');
    end
    xlim([-1.5 1.5]); ylim([-1.5 1.5]);
end
