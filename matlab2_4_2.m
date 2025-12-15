T = [31 31 32 32 33 34 34 33 32 32 31 31;
     31 32 33 34 35 36 36 35 34 33 32 31;
     32 33 35 36 37 38 38 37 36 32 31 30;
     33 34 36 37 38 39 39 38 37 33 32 31;
     33 34 36 37 38 39 39 38 37 33 32 31;
     32 33 35 36 37 38 38 37 36 32 31 30;
     31 32 33 34 35 36 36 35 34 33 32 31;
     30 31 31 32 33 34 34 33 32 31 31 30];

% xの分割
x = 1:12

% yの分割
y = 1:8

% contour図の作成
figure
contourf(x,y,T,15,"LineColor","none");
colormap("turbo");
caxis([30 39]);
surf(peaks)
c = colorbar;
ylabel(c,"地表面温度 [°C]")
title("都市ヒートアイランド：地表面温度");  
xlabel("x[km]");
ylabel("y[km]");



% ここまでに書いたコードの内容がpng形式で"3_1_Q5_practice"という名前で保存されます
saveas(gcf,'vis_q1.png');

% === 以下，MATLAB Grader上で作図が正確に作れているかを判定するプロセス ===
% === 絶対に変更しないでください！ =======================================
    image1_vis_q1 = imread('vis_q1.png');
    image2_vis_q1 = imread('vis_q1_practice.png');

    if ~isequal(size(image1_vis_q1), size(image2_vis_q1))
        image2_vis_q1 = imresize(image2_vis_q1, [size(image1_vis_q1, 1), size(image1_vis_q1, 2)]);
    end

    grayImage1_vis_q1 = rgb2gray(image1_vis_q1);
    grayImage2_vis_q1 = rgb2gray(image2_vis_q1);
    ssimValue_vis_q1 = ssim(grayImage1_vis_q1, grayImage2_vis_q1);
% =======================================================================
