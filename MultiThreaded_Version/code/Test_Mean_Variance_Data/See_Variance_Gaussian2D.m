clear all;


data = load('F:\LAB_new\LAB\Eye_track_code\Eye_Pos_Track\EyeGazeTrackingSystem_v3\EyeGazeTrackingSystem_v3\Test_Mean_Variance_Data\med_down_19\centerEstimation_convexHullFineCenter_vfinal.txt');

mu = mean(data); %// mean of data
sigma = cov(data); %// data
x = 0:1:640; %// x axis
y = 0:1:480; %// y axis

[X Y] = meshgrid(x,y); %// all combinations of x, y
Z = mvnpdf([X(:) Y(:)],mu,sigma); %// compute Gaussian pdf
Z = reshape(Z,size(X)); %// put into same size as X, Y
contour(X,Y,Z), axis equal  %// contour plot; set same scale for x and y...


text(30 , 400 , ['mean = ' , '(' ,num2str(mu(1 , 1)) ',' , num2str(mu(1 , 2)) ,')'] ,'color','r','Fontsize',18);
text(30 , 350 , ['stddev = ' , num2str(sqrt(sigma(2 , 2)))] ,'color','r','Fontsize',18);
