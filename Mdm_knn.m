Train = readtable("clean_train.csv");
Xtrain = table2array(Train(:, 3: end -1));
Ytrain = Train.satisfaction;

% ACC_train = [];
% ACC_val = [];

% for j=1:3
%     j
%     n_ = size(Xtrain,1);
%     [indtrain_CV, indval_CV] = dividerand(n_, 0.8 ,0.2);
%     Xtrain_CV = Xtrain(indtrain_CV,:);
%     ytrain_CV = Ytrain(indtrain_CV,:);
%     Xval_CV = Xtrain(indval_CV,:);
%     yval_CV = Ytrain(indval_CV,:);
% 
%     for i = 1:20
% 
% 
%         knn = fitcknn(Xtrain_CV, ytrain_CV,'NumNeighbors', i, "Standardize",true);
% 
% 
% 
%         confmat_train = confusionmat(ytrain_CV , knn.predict(Xtrain_CV) );
%         ACC_train(i,j) = trace(confmat_train)/sum(confmat_train(:));
% 
%         confmat_val = confusionmat(yval_CV , knn.predict(Xval_CV) );
%         ACC_val(i,j) = trace(confmat_val)/sum(confmat_val(:));
%         %ACC_val = [ACC_val, ]
% 
%     end
% end
% 
% 
% ACC_train_mean = mean(ACC_train,2); 
% ACC_val_mean = mean(ACC_val,2);
% 
% 
% figure;
% plot(ACC_train_mean); 
% hold; 
% plot(ACC_val_mean,'r'); 
% grid on; 
% title('graph of test vs validation accuracy for 10 repetitions'); 
% xlabel('num k'); ylabel('ACC');
% legend({'Train','Validation'})

% [best_valACC, ind] = max(ACC_val_mean);

Test = readtable("clean_test.csv");
Xtest = table2array(Test(:, 3: end -1));
Ytest = Test.satisfaction;


ind = 9
knn = fitcknn(Xtrain, Ytrain,'NumNeighbors', ind, "Standardize",true);
confmat = confusionmat(Ytest , knn.predict(Xtest));
ACC_test = trace(confmat)/sum(confmat(:))



