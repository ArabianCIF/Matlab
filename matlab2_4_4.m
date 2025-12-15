%1 
 x      = 0:0.005:0.30;  % x座標の分割点ベクトル [km]
    y      = 00.005:0.20
    x0     = 0.15
    y0     = 0.10
    Tplate = 20.0
    Tice   =-5.0
    sigma0 =  0.03
    alpha  =1.0*10^-5;
    [X, Y] = meshgrid(x, y);    % x（列方向）と y（行方向）の座標ベクトルから,全組合せの格子点を表す行列 X,Y を生成する．
                                % これにより (X-x0).^2 などの要素演算ができ，後述する無名関数 Tfun を格子上で評価できる．
                                % なお，(X-x0).^2 の『.^2』の部分は，計算格子の要素ごとの 2乗を指す演算子．
                                % 今回のように，(X-x0)などのようなベクトルに対し，まとめて演算する際に，『.*』『./』『.^2』のような使い方をする．
                                % また contourf(x,y,T,...) を使うとき，T のサイズは X, Y と同じ必要が
%2
 Tfun = @(t) ( Tplate - (Tplate - Tice) * exp( -(((X - x0).^2 + (Y - y0).^2)./ (2*(sigma0^2 + 4*alpha*t))) ) );
    
    %=== 上記の簡単な解説 === 
    % funはfunctionの略
    
    T30  = Tfun(30)     % t=30の場合
    T60  = Tfun(60)     % t=60の場合
    T90  = Tfun(90)     % t=90の場合
    T120 = Tfun(120)    % t=120の場合

%3
function gettingImage(Tx)
    figure()
    contourf(x,y,Tx,20,"LineColor","none");
    axisimage;
    set(gca,'YDir','normal');     % y軸は上向き正
    clims = [min(Tx), max(Tx)];
    caxis(clims);
    colormap("parula");
    hcb = colorbar;
    ylabel(hcb,'温度 [°C]');
    xlabel('X 位置 [m]'); 
    ylabel('Y 位置 [m]');
end

%---------------------------------------------------
%t=30s
figure('Color','w')
gettingImage(T30);
title('t=30s');

%t=60s
figure('Color','w')
gettingImage(T60);
title('t=60s');
%t=90s
figure('Color','w')     
gettingImage(T90);
title('t=90s'); 
%t=120s
figure('Color','w')     
gettingImage(T120);
title('t=120s');    