close
fig2 = figure();
lx = 5;
ly = 10;
for cnt=1:1:length(X)
    clf
    axis vis3d equal;
    camlight;
    xlim([-30 30])
    ylim([0 20])
    v = [X(cnt,1)-lx 0; X(cnt,1)+lx 0; X(cnt,1)+lx ly; X(cnt,1)-lx ly];
    f = [1 2 3 4];
    patch('Faces',f,'Vertices',v,'FaceColor','black');
%     campos([X(cnt),0,500]);
%     camtarget([X(cnt),0,0]);
    grid on
    drawnow
end