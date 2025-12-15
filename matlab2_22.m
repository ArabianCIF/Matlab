%q1-1
x = linspace(-6,6,21)
y = 1/(1+exp(-0.5*x))
%q1-2
bar(x,y)
%q1-3
title("ジグモイド関数を使ったbarプロットの演習")
xlabel("x")
ylabel("y")

%q2-1
y1 = [45 23 11; 32 15 12; 63 43 36; 76 35 8; 66 60 55]
%q2-2
bar(y1,"stacked")
title("積み上げbarプロットの演習")
xlabel("x")
ylabel("y")
%q2-3
bar3(y1,"stacked")
title("bar3プロットの演習")
xlabel("x")
ylabel("y")
test