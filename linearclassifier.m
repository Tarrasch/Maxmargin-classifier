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
[n, d] = size(X);


% Solve optimization problem
cvx_begin
    variable delta
    variable w(d)
    variable b 
    minimize ( delta )
    subject to
        d >= 0;
        Y.*(w'*X' - b)' >= 1 - delta;
cvx_end


% Plot on a graph
plot(X,'.')


