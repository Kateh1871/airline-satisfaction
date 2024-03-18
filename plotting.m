
data = readtable(".\data\clean_train.csv");

% Plot histogram of age by passenger satisfaction
% --------------------------------
% hold on;
% histogram(data.Age(string(data.satisfaction) == '0'));
% histogram(data.Age(string(data.satisfaction) == '1'));
% xlabel("Age");
% ylabel("count");
% legend({"Unsatified", "Satisfied"});
% title("Passenger age broken down by satisfaction")
% hold off;
% clear;

% Plot bar chart of satisfacion by gender
% -------------------------------
% hold on;
% x = categorical({'unsatisfied', 'satisfied'});
% % theres probabily a much better way of doing this
% y = [length(data.Gender(string(data.satisfaction) == '0' & string(data.Gender) == '0')), ...
%     length(data.Gender(string(data.satisfaction) == '1' & string(data.Gender) == '0')); ...
%     length(data.Gender(string(data.satisfaction) == '0' & string(data.Gender) == '1')), ...
%     length(data.Gender(string(data.satisfaction) == '1' & string(data.Gender) == '1'))];
% bar(x, y)
% ylabel("count");
% legend({"men", "women"});
% title("Satisfaction broken down by gender")
% hold off;
% clear;

% Plot bar chart of satisfacion by class
% -------------------------------
hold on;
x = categorical({'unsatisfied', 'satisfied'});
% theres probabily a much better way of doing this
y = [length(data.Class(string(data.satisfaction) == '0' & string(data.Class) == '0')), ...
    length(data.Class(string(data.satisfaction) == '1' & string(data.Class) == '0')); ...
    length(data.Class(string(data.satisfaction) == '0' & string(data.Class) == '1')), ...
    length(data.Class(string(data.satisfaction) == '1' & string(data.Class) == '1')); ...
    length(data.Class(string(data.satisfaction) == '0' & string(data.Class) == '2')), ...
    length(data.Class(string(data.satisfaction) == '1' & string(data.Class) == '2'))];
bar(x, y)
ylabel("count");
legend({"eco", "eco plus", "business"});
title("Satisfaction broken down by passenger class")
hold off;
clear;


