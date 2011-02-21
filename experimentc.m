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

% Plot on a graph
hold on
for i = 1:n
    if Y(i) > 0
        plot(X(i,1),X(i,2),'.')
    else
        plot(X(i,1),X(i,2),'r.')
    end
end

for i = -2:0
    C = 10^i;

    % Solve optimization problem
    cvx_begin
        variable xi(n)
        variable w(d)
        variable b 
        dual variables alpha rho
        minimize ( norm(w)/2 + C*sum(xi) )
        subject to
            alpha : Y.*(w'*X' - b)' >= 1 - xi;
            rho   : xi >= 0;
    cvx_end

    hold on
    x = [0 8];
    y = (b-w(1)*x)/w(2);
    plot(x,y, 'color', [(i+2)/2 (-i)/2 0])
    hold off

end