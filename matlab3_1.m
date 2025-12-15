DT = readtable("Temp_Rain_data_Tokyo_Fukuoka_2022_1hour.xlsx")
DTtime  = table2timetable(DT);
% 問題3
fukuoka_temp = DTtime.fukuoka_temp   
tempdiff = fukuoka_temp -tokyo_temp
tempdiff = fukuoka_temp -tokyo_temp

%max_temp_diffとmax_indexの抽出
[max_temp_diff, max_index] = max(abs(tempdiff))   
mtd_day_time = DTtime.day_time(max_index)
% 問題4
DTmonth_avr =retime(DTtime,'monthly',@mean)

% 問題5
% 以下に作図のためのコードを記述してください
plot(DTtime.day_time, DTtime.fukuoka_temp,"r-")
hold on
plot(DTtime.day_time, DTtime.tokyo_temp,"r-")
hold on
plot(DTmonth_avr.day_time, DTmonth_avr.fukuoka_temp,"yo")
hold on     
plot(DTmonth_avr.day_time, DTmonth_avr.tokyo_temp, "yo")
hold off
legend('Fukuoka hourly temp avr','Tokyo hourly temp avr', 'Fukuoka monthly temp avr','Tokyo monthly temp avr', Location='northwest')

% ここまでに書いたコードの内容がpng形式で"3_1_Q5_practice"という名前で保存されます
saveas(gcf,'3_1_Q5_practice.png');

% === 以下，MATLAB Grader上で作図が正確に作れているかを判定するプロセス ===
% === 絶対に変更しないでください！ =======================================
    image1_Q5 = imread('3_1_Q5.png');
    image2_Q5 = imread('3_1_Q5_practice.png');

    if ~isequal(size(image1_Q5), size(image2_Q5))
        image2_Q5 = imresize(image2_Q5, [size(image1_Q5, 1), size(image1_Q5, 2)]);
    end

    grayImage1_Q5 = rgb2gray(image1_Q5);
    grayImage2_Q5 = rgb2gray(image2_Q5);
    ssimValue_Q5 = ssim(grayImage1_Q5, grayImage2_Q5);
% =======================================================================
   

% 問題6
DTmonth_sum =retime(DTtime,'monthly',@sum)
figure 
% 以下に作図のためのコードを記述してください
bar(DTmonth_sum.day_time, [DTmonth_sum.fukuoka_rain, DTmonth_sum.tokyo_rain])


% ここまでに書いたコードの内容がpng形式で"3_1_Q6_practice"という名前で保存されます
saveas(gcf,'3_1_Q6_practice.png');

% === 以下，MATLAB Grader上で作図が正確に作れているかを判定するプロセス ===
% === 絶対に変更しないでください！ =======================================
image1_Q6 = imread('3_1_Q6.png');
image2_Q6 = imread('3_1_Q6_practice.png');

    if ~isequal(size(image1_Q6), size(image2_Q6))
        image2_Q6 = imresize(image2_Q6, [size(image1_Q6, 1), size(image1_Q6, 2)]);
    end

    grayImage1_Q6 = rgb2gray(image1_Q6);
    grayImage2_Q6 = rgb2gray(image2_Q6);
    ssimValue_Q6 = ssim(grayImage1_Q6, grayImage2_Q6);