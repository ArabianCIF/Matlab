%q1
z3 = 0:pi()/50:20*pi()
r3 = 5*z3
x3 = r3.*sin(z3)

y3 = r3.*cos(z3)
%3D plot
plot3(  x3,y3,z3)
title("アルキメデスの螺旋")
xlabel("x")
ylabel("y")
zlabel("z")
