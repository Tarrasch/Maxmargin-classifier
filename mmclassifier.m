%{
 TBD:       w and b
 Given:     (multi)set D = {xi, yi} (the training data), (n elements)
            where xi is a vector in d-dimensional space
            and  yi is ±1 depending in group it belongs in
            
            We simply represent that multiset as X[n][d] and Y[n] 
%}

% Load data and assign fine names to variables
load(['excercise1']);
X = train_data;
Y = train_label;
clear train_data train_label;
[n, d] = size(X);

C = 1;

% Solve optimization problem
cvx_begin
    variable xi(n)
    variable w(d)
    variable b 
    minimize ( norm(w)/2 + C*sum(xi) )
    subject to
        Y.*(w'*X' - b)' >= 1 - xi;
        xi >= 0;
cvx_end

w 
b

% Plot on a graph
hold on
for i = 1:n
    if Y(i) > 0
        plot(X(i,1),X(i,2),'.')
    else
        plot(X(i,1),X(i,2),'r.')
    end
end
x = [0 100];
y = -(w(1)*x+b)/w(2);
%plot(x,y)
hold off