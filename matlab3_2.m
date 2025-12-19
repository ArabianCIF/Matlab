% 問題1
DT = readtable('2021-2023_Aug_temp_Fukuoka.xlsx');
fukuoka_temp = table2timetable(DT);
 
% 問題2
temp_2021_20 = movmean(fukuoka_temp.temp_2021,20);
temp_2022_20 = movmean(fukuoka_temp.temp_2022,20);
temp_2023_20 = movmean(fukuoka_temp.temp_2023,20);

% 問題3
figure

subplot(3,1,1)
hold on
ylim([20 40])
plot(fukuoka_temp.day_time_2021, fukuoka_temp.temp_2021, 'r-')
plot(fukuoka_temp.day_time_2021, temp_2021_20, 'b-')
hold off
subplot(3,1,2)
hold on
ylim([20 40])
plot(fukuoka_temp.day_time_2022, fukuoka_temp.temp_2022, 'g-')
plot(fukuoka_temp.day_time_2022, temp_2022_20, 'b-')
hold off
subplot(3,1,3)
hold on
plot(fukuoka_temp.day_time_2023, fukuoka_temp.temp_2023, 'k-')
plot(fukuoka_temp.day_time_2023, temp_2023_20, 'b-')
ylim([20 40])
hold off

% ここまでに書いたコードの内容がpng形式で"3_2_Q3_practice"という名前で保存されます
saveas(gcf, '3_2_Q3_practice.png');

image1_Q3 = imread('3_2_Q3.png');
image2_Q3 = imread('3_2_Q3_practice.png');

    if ~isequal(size(image1_Q3), size(image2_Q3))
        image2_Q3 = imresize(image2_Q3, [size(image1_Q3, 1), size(image1_Q3, 2)]);
    end

    grayImage1_Q3 = rgb2gray(image1_Q3);
    grayImage2_Q3 = rgb2gray(image2_Q3);
    ssimValue_Q3 = ssim(grayImage1_Q3, grayImage2_Q3);
% ===========================================================
    

% 問題4
diff_temp_2021 = diff(fukuoka_temp.temp_2021);
diff_temp_2022 = diff(fukuoka_temp.temp_2022);
diff_temp_2023 = diff(fukuoka_temp.temp_2023);
figure

subplot(3,1,1)
hold on
ylim([-5 5])
plot(fukuoka_temp.day_time_2021(2:end), diff_temp_2021, 'r-')
hold off
subplot(3,1,2)
hold on
ylim([-5 5])
plot(fukuoka_temp.day_time_2022(2:end), diff_temp_2022, 'g-')
hold off
subplot(3,1,3)
hold on
plot(fukuoka_temp.day_time_2023(2:end), diff_temp_2023, 'b-')
ylim([-5 5])
hold off


% ここまでに書いたコードの内容がpng形式で"3_2_Q4_practice"という名前で保存されます
saveas(gcf, '3_2_Q4_practice.png');

image1_Q4 = imread('3_2_Q4.png');
image2_Q4 = imread('3_2_Q4_practice.png');

    if ~isequal(size(image1_Q4), size(image2_Q4))
        image2_Q4 = imresize(image2_Q4, [size(image1_Q4, 1), size(image1_Q4, 2)]);
    end

    grayImage1_Q4 = rgb2gray(image1_Q4);
    grayImage2_Q4 = rgb2gray(image2_Q4);
    ssimValue_Q4 = ssim(grayImage1_Q4, grayImage2_Q4);
