% Plot on a graph
hold on
for i = 1:n
    if Y(i) > 0
        plot(X(i,1),X(i,2),'.')
    else
        plot(X(i,1),X(i,2),'r.')
    end
end
hold on
x = [0 8];
y = -(w(1)*x-b)/w(2);
plot(x,y, 'g')
hold off