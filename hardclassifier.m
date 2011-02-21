%{
 TBD:       w and b
 Given:     (multi)set D = {xi, yi} (the training data), (n elements)
            where xi is a vector in d-dimensional space
            and  yi is ±1 depending in group it belongs in
            
            We simply represent that multiset as X[n][d] and Y[n] 
%}

% Load data and assign fine names to variables
load('excercise1');
X = train_data;
Y = train_label;
clear train_data train_label;
[n, d] = size(X);

C = 1;

% Solve optimization problem
cvx_begin
    variable w(d)
    variable b 
    dual variables alpha rho
    minimize ( norm(w)/2)
    subject to
        alpha : Y.*(w'*X' - b)' >= 1;
cvx_end

% Plot on a graph
hold on
for i = 1:n
    if Y(i) > 0
        plot(X(i,1),X(i,2),'.')
    else
        plot(X(i,1),X(i,2),'r.')
    end
    if alpha(i) > eps+0.00001
        plot(X(i,1),X(i,2),'ko')
    end
end

hold on
x = [0 8];
y = (b-w(1)*x)/w(2);
plot(x,y, 'g')
y = (b-w(1)*x+1)/w(2);
plot(x,y, 'c--')
y = (b-w(1)*x-1)/w(2);
plot(x,y, 'c--')
hold off
