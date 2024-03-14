% converts all data columns into integer values
% the grammar on the default data is inconsisent so be careful everything 
% that should change does

% whether youre cleaning 'test' or 'train' data
data_type = 'train';
data = readtable(join(['raw_' data_type '.csv']));

% gender conversion; male = 0, female = 1
gender = string(data.Gender);
gender(gender == 'Male') = 0;
gender(gender == 'Female') = 1;
data.Gender = cellstr(gender);

% customer loyalty; disloyal = 0, loyal = 1
type = string(data.CustomerType);
type(type == 'disloyal Customer') = 0;
type(type == 'Loyal Customer') = 1;
data.CustomerType = cellstr(type);

% reason for travel; personal = 0, business = 1
reason = string(data.TypeOfTravel);
reason(reason == 'Personal Travel') = 0;
reason(reason == 'Business travel') = 1;
data.TypeOfTravel = cellstr(reason);

% ticket class; eco = 0, eco plus = 1, business = 2
class = string(data.Class);
class(class == 'Eco') = 0;
class(class == 'Eco Plus') = 1;
class(class == 'Business') = 2;
data.Class = cellstr(class);

% overall satisfaction; neutral/dissasitsfied = 0, satisfied = 1;
satisfaction = string(data.satisfaction);
satisfaction(satisfaction == 'neutral or dissatisfied') = 0;
satisfaction(satisfaction == 'satisfied') = 1;
data.satisfaction = cellstr(satisfaction);


% saving new data
% DO NOT OVERWRITE ORIGINAL RAW DATA
writetable(data, join(['clean_' data_type '.csv']));
clear;      % clear variables after use

