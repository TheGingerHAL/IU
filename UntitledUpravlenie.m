%�������3
syms d1 d2 d3 a1a2 a3 q1 q2 q3 alpha1 alpha2 alpha3;
syms L1 L2 L3 D3 Q1 Q2;
d1=L1;
d2=0;
d3=D3;

a1=0;
a2=0;
a3=0;

q1=Q1;
q2=Q2;
q3=0;

alpha1=90; %� ��������
alpha2=90; %� ��������
alpha3=0; %� ��������

%������ ������
A1= [
    cos(q1) -cosd(alpha1)*sin(q1) sind(alpha1)*sin(q1) a1*cos(q1)
    sin(q1) cosd(alpha1)*cos(q1) -sind(alpha1)*cos(q1) a1*sin(q1)
    0 sind(alpha1) cosd(alpha1) d1
    0 0 0 1
    ];

A1
A2= [
    cos(q2) -cosd(alpha2)*sin(q2) sind(alpha2)*sin(q2) a2*cos(q2)
    sin(q2) cosd(alpha2)*cos(q2) -sind(alpha2)*cos(q2) a2*sin(q2)
    0 sind(alpha2) cosd(alpha2) d2
    0 0 0 1
    ];
A2
A3= [
    cos(q3) -cosd(alpha3)*sin(q3) sind(alpha3)*sin(q3) a3*cos(q3)
    sin(q3) cosd(alpha3)*cos(q3) -sind(alpha3)*cos(q3) a3*sin(q3)
    0 sind(alpha3) cosd(alpha3) d3
    0 0 0 1
    ];
A3

T0=eye(4);
T1=T0*A1;
T2=T1*A2;
T3=T2*A3;
T3

% �������� ������
% �������� ������� �-1
Aminus1 = inv(A1);
Aminus1 
Aminus1 * T3

syms xx yx zx px xy yy zy py xz yz zz pz
MyT3= [
    xx yx zx px
    xy yy zy py
    xz yz zz pz
    0 0 0 1
    ];
% ����������� ������� �1
MyAminus1 = [
    cos(Q1) sin(Q1) 0 0
    0 0 1 -L1
    sin(Q1) -cos(Q1) 0 0
    0 0 0 1
    ];

MyAminus1*MyT3
A23 = A2*A3
PX=T3(1,4)
PY=T3(2,4)
PZ=T3(3,4)

Q1=atan2(PX, PY)

Q2 = atan2(T3(1, 1)/A23(1, 1), T3(1, 3)/A23(1, 3));


% ������ ������ � ��������
% ������ ���������� �������� ������������. �������������
% Z0 - ��� z-���������� �� ������� T0
Z0 = [ T0(1, 3) 
    T0(2, 3)
    T0(3, 3)];
Z1 = [ T1(1, 3) 
    T1(2, 3)
    T1(3, 3)];
Z2 = [ T2(1, 3) 
    T2(2, 3)
    T2(3, 3)];
Z3 = [ T3(1, 3) 
    T3(2, 3)
    T3(3, 3)];
% P03 - ��� ������ P �� T3, ������� ���������� ������� �� 0-��� �������
% ��������� � 3-�
P01 = [ T1(1, 4) 
    T1(2, 4)
    T1(3, 4)];
P02 = [ T2(1, 4) 
    T2(2, 4)
    T2(3, 4)];
P03 = [ T3(1, 4) 
    T3(2, 4)
    T3(3, 4)];
P13 = P03-P01;
P23 = P03-P02;
% ������ ����� ������������
J1 = [Z0
    Z0.*P03];
J1
% ������ ����� ������������
J2 = [Z1
    Z1.*P13];
J2
% ������ ����� ���������������
J3 = [0
    Z2];
J3

J = [J1, J2, J3];
J