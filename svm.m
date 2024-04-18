Train = readtable("clean_train.csv");
Xtrain = table2array(Train(:, 3:end-1));
Ytrain = categorical(Train.satisfaction);

% Load testing data
Test = readtable("clean_test.csv");
Xtest = table2array(Test(:, 3:end-1));
Ytest = categorical(Test.satisfaction);

% Train SVM model
SVMModel = fitcsvm(Xtrain, Ytrain, 'Standardize', true, 'KernelFunction', 'linear');

% Predict using the trained model
Ypred = predict(SVMModel, Xtest);

% Evaluate model performance
accuracy = sum(Ypred == Ytest) / numel(Ytest);
fprintf('Accuracy of SVM model: %.2f%%\n', accuracy * 100);
