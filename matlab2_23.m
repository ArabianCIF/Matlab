% 事前準備1：MATLABオンライン上にすでに導入されている'iris_dataset'というデータセットを取得し，これを『iris_DS』とする．
iris_DS = iris_dataset;

% 事前準備2：アヤメの種類ごとにデーターセットを分割する．
sentosa_DS    = iris_DS(:,1:50);
versicolor_DS = iris_DS(:,51:100);
virginica_DS  = iris_DS(:,101:150);
% 1-1　アヤメの種類ごとに，「がく片の長さ」の最大値を求める
sentosa_DS_max_sepal    = max(sentosa_DS(1,:));
versicolor_DS_max_sepal = max(versicolor_DS(1,:));
virginica_DS_max_sepal  = max(virginica_DS(1,:));

% 1-2　アヤメの種類ごとに，「花弁の幅」の最小値を求める．
sentosa_DS_min_sepal    = min(sentosa_DS(4,:));
versicolor_DS_min_sepal = min(versicolor_DS(4,:));
virginica_DS_min_sepal  = min(virginica_DS(4,:));
% 2-1 アヤメの「がく片の幅」に関する箱ひげ図を作図せよ
sentosa_SW    =  sentosa_DS(2,:);
sentosa_SW    = sentosa_SW';
versicolor_SW = versicolor_DS(2,:);
versicolor_SW = versicolor_SW'
virginica_SW  = virginica_DS(2,:);
virginica_SW  = virginica_SW'
figure()
boxplot([sentosa_SW,versicolor_SW,virginica_SW],'Labels',{'setosa','versicolor','virginica'});
title('sepal_length')
% 2-2 アヤメの「花弁の長さ」に関する箱ひげ図を作図せよ
sentosa_PL    = sentosa_DS(3,:);
sentosa_PL    = sentosa_PL';
versicolor_PL = versicolor_DS(3,:);
versicolor_PL = versicolor_PL';
virginica_PL  = virginica_DS(3,:);
virginica_PL  = virginica_PL';
figure()
boxplot([sentosa_PL,versicolor_PL,virginica_PL],'Labels',{'setosa','versicolor','virginica'});
title('sepal_length')
