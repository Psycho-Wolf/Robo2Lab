function TwoLinkPlanarDraw(gamma)

theta1 = gamma(1);
theta2 = gamma(2);


h = clf(gcf);

Floor_v = [-1 1 0;...
    1 1 0;...
    -1 -1 0;...
    1 -1 0];
Floor_f = [1 2 4 3];

patch('Faces',Floor_f,'Vertices',Floor_v,'EdgeColor','None','FaceColor',[0 0 .8],'FaceAlpha',.5);
hold on
set(gcf,'Position',[50, 50, 950, 900])

[Base,Base_f,n,c,stltitle]   = stlread('YK220x_Base.stl');
[Link1,Link1_f,n,c,stltitle] = stlread('YK220x_Link1.stl');
[Link2,Link2_f,n,c,stltitle] = stlread('YK220x_Link2.stl');


rBfromI = [0;0;0];
r1fromB = [0;0;0.149];
r2from1 = [.111;0;.022];


T1 = rotzRad(theta1);
T2=T1*rotzRad(theta2);


rB=rBfromI;
r1=rB+r1fromB;
r2=r1+T1*r2from1;

Base_v=repmat(rB,1,length(Base))+Base';
Link1_v=repmat(r1,1,length(Link1))+T1*Link1';
Link2_v=repmat(r2,1,length(Link2))+T2*Link2';


patch('Faces',Base_f,'Vertices',Base_v','EdgeColor','None','FaceColor',[.792157 .819608 .933333]);
patch('Faces',Link1_f,'Vertices',Link1_v','EdgeColor','None','FaceColor',[.792157 .819608 .933333]);
patch('Faces',Link2_f,'Vertices',Link2_v','EdgeColor','None','FaceColor',[.792157 .819608 .933333]);

axis equal
camlight left
set(gca,'projection','perspective')
view([1;1;.5])
axis([-.4 .4 -.4 .5 0 .5]);
hold off;