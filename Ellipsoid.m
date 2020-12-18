d1=60; a1 = 40; a2 = 30;
L1 = Link ([0,d1,a1,0,0]); %revolute
L2 = Link ([0,0,a2,0,0]); %revolute
L3 = Link ([0,0,0,0,1]); %prismatic
L(3).qlim = [0,10]; %limit path for prismatic
Rob = SerialLink ([L1 L2 L3]); %integrate all links
Rob.name = 'SCARA'
input = readmatrix('Ellipsoid.xlsx', 'Sheet',"Ellipsoid")%read the value of x, y and z as shown in Table 3
T = transl(input) %represents the location of end effector
qa = Rob.ikine(T,[2.48 1.61 35],[1,1,1,0,0,0]); %inverse kinematics
T_Temp = qa; %forward kinematics
Q = fkine(Rob,T_Temp);

for i = 1:(length(qa)-1) %movement of robot
    Rob.plot(qa,'workspace',[-100,100,-100,100,-100,100]);
    pause(0.02)