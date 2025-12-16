% 問題 1
% 問題 1
x      = 0:0.005:0.30;  % x座標の分割点ベクトル [km]
y      = 0:0.005:0.20;  % y座標の分割点ベクトル [km]    
x0     = 0.15;
y0     = 0.10;
Tplate = 22.0;
Tice   =-5.0;
sigma0 =  0.03;
alpha  =1.0*10^-5;
%合せの格子点を表す行列 X,Y を生成する．
                                % これにより (X-x0).^2 などの要素演算ができ，後述する無名関数 Tfun を格子上で評価できる．
                                % なお，(X-x0).^2 の『.^2』の部分は，計算格子の要素ごとの 2乗を指す演算子．
                                % 今回のように，(X-x0)などのようなベクトルに対し，まとめて演算する際に，『.*』『./』『.^2』のような使い方をする．
   
[X, Y] = meshgrid(x, y);

% 問題 2
Tfun = @(t) ( Tplate - (Tplate - Tice) ...
                 * exp( -(((X - x0).^2 + (Y - y0).^2)./ (2*(sigma0^2 + 4*alpha*t))) ) );

    T30  = Tfun(30);     % t=30の場合
    T60  = Tfun(60);     % t=60の場合
    T90  = Tfun(90);     % t=90の場合
    T120 = Tfun(120);    % t=120の場合
% 問題 3
% 各4枚のコンター図のカラースケールの最大値，最小値を統一するためのステップ
clims = [ min([T30(:); T60(:); T90(:); T120(:)]), ...
          max([T30(:); T60(:); T90(:); T120(:)]) ];

function gettingImage(Tx,x1,y1)
    figure()
    contourf(x1,y1,Tx,20,"LineColor","none");
    axis image;
    set(gca,'YDir','normal');     % y軸は上向き正
    clims = [min(Tx(:)), max(Tx(:))];
    caxis(clims);
    colormap("parula");
    hcb = colorbar;
    ylabel(hcb,'温度 [°C]');
    xlabel('X 位置 [m]'); 
    ylabel('Y 位置 [m]');
end
% --- t = 30 s ---
figure('Color','w');                            % 「新しいwindowを背景白として設定し，その上に作図する」　という意味
gettingImage(T30,x,y);
title('t=30s');
% === 絶対に変更しないでください！ =======================================
    image1_vis_q3_1 = imread('vis_q3_1.png');
    image2_vis_q3_1 = imread('vis_q3_1_practice.png');

    if ~isequal(size(image1_vis_q3_1), size(image2_vis_q3_1))
        image2_vis_q3_1 = imresize(image2_vis_q3_1, [size(image1_vis_q3_1, 1), size(image1_vis_q3_1, 2)]);
    end

    grayImage1_vis_q3_1 = rgb2gray(image1_vis_q3_1);
    grayImage2_vis_q3_1 = rgb2gray(image2_vis_q3_1);
    ssimValue_vis_q3_1 = ssim(grayImage1_vis_q3_1, grayImage2_vis_q3_1);
% =======================================================================

% ここまでに書いたコードの内容がpng形式で"vis_q3_1.png"という名前で保存されます
saveas(gcf,'vis_q3_1.png');


% --- t = 60 s ---
figure('Color','w');
gettingImage(T60,x,y);
title('t=60s');


% === 絶対に変更しないでください！ =======================================
    image1_vis_q3_2 = imread('vis_q3_2.png');
    image2_vis_q3_2 = imread('vis_q3_2_practice.png');

    if ~isequal(size(image1_vis_q3_2), size(image2_vis_q3_2))
        image2_vis_q3_2 = imresize(image2_vis_q3_2, [size(image1_vis_q3_2, 1), size(image1_vis_q3_2, 2)]);
    end

    grayImage1_vis_q3_2 = rgb2gray(image1_vis_q3_2);
    grayImage2_vis_q3_2 = rgb2gray(image2_vis_q3_2);
    ssimValue_vis_q3_2 = ssim(grayImage1_vis_q3_2, grayImage2_vis_q3_2);
% =======================================================================   



% ここまでに書いたコードの内容がpng形式で"vis_q3_2.png"という名前で保存されます
saveas(gcf,'vis_q3_2.png');


% --- t = 90 s ---
figure('Color','w');
gettingImage(T90,x,y);
title('t=90s'); 

% === 絶対に変更しないでください！ =======================================
    image1_vis_q3_3 = imread('vis_q3_3.png');
    image2_vis_q3_3 = imread('vis_q3_3_practice.png');

    if ~isequal(size(image1_vis_q3_3), size(image2_vis_q3_3))
        image2_vis_q3_3 = imresize(image2_vis_q3_3, [size(image1_vis_q3_3, 1), size(image1_vis_q3_3, 2)]);
    end

    grayImage1_vis_q3_3 = rgb2gray(image1_vis_q3_3);
    grayImage2_vis_q3_3 = rgb2gray(image2_vis_q3_3);
    ssimValue_vis_q3_3 = ssim(grayImage1_vis_q3_3, grayImage2_vis_q3_3);
% =======================================================================   


% ここまでに書いたコードの内容がpng形式で"vis_q3_3.png"という名前で保存されます
saveas(gcf,'vis_q3_3.png');


% --- t = 120 s ---
figure('Color','w');

gettingImage(T120,x,y);
title('t=120s');    
% === 絶対に変更しないでください！ =======================================
    image1_vis_q3_4 = imread('vis_q3_4.png');
    image2_vis_q3_4 = imread('vis_q3_4_practice.png');

    if ~isequal(size(image1_vis_q3_4), size(image2_vis_q3_4))
        image2_vis_q3_4 = imresize(image2_vis_q3_4, [size(image1_vis_q3_4, 1), size(image1_vis_q3_4, 2)]);
    end

    grayImage1_vis_q3_4 = rgb2gray(image1_vis_q3_4);
    grayImage2_vis_q3_4 = rgb2gray(image2_vis_q3_4);
    ssimValue_vis_q3_4 = ssim(grayImage1_vis_q3_4, grayImage2_vis_q3_4);
% =======================================================================

% ここまでに書いたコードの内容がpng形式で"vis_q3_4.png"という名前で保存されます
saveas(gcf,'vis_q3_4.png');

