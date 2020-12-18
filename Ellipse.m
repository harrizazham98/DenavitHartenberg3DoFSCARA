d1=60; a1 = 40; a2 = 30;
L1 = Link ([0,d1,a1,0,0]); %revolute
L2 = Link ([0,0,a2,0,0]); %revolute
L3 = Link ([0,0,0,0,1]); %prismatic
L(3).qlim = [0,10]; %limit for prismatic path
Rob = SerialLink ([L1 L2 L3]); %integrate all links
Rob.name = 'SCARA'
input = readmatrix('Ellipse.xlsx', 'Sheet',"EllipsePath")% read the data of x, y and z as shown in Table 3
plot3(input(:,1), input(:,2), input(:,3)) %draw the path in graph
T = transl(input) %represents the translation of end effector
qa = Rob.ikine(T,[2.48 1.61 -45],[1,1,1,0,0,0]); %inverse kinematics
T_Temp = qa;
Q = fkine(Rob,T_Temp); &forward kinematics
for i = 1:(length(qa)-1) % movement of robot within path
    Rob.plot(qa,'workspace',[-100,100,-100,100,-100,100]);
    pause(0.02)
end