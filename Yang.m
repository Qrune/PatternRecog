
%5
mc = MarkovChain([0.75; 0.25], [0.79 0.01 0.2; 0.03 0.77 0.2]);

B(1) = GaussD('Mean', 0, 'StDev', 1);
B(2) = GaussD('Mean', 3, 'StDev', 2);

h = HMM(mc, B);

N = 100; average = 0;

for i=1:N 
     [X, S] = rand(h, 500);
     average = average + length(S);
end
display(average/N);

q = [0.75;0.25];
A = [0.99, 0.01; 0.03, 0.97];
B(1) = GaussD('Mean',[0,10],'Covariance',[2 1;1 4]);
B(2) = GaussD('Mean',[30,55],'Covariance',[3 1;1 3]);
mc = MarkovChain(q,A);
hmm = HMM(mc,B);
N = 500;
[X,S] = rand(hmm,N);
plot(X);
hold on;
plot(S);
xlabel('Time');
ylabel('X[t]');
legend('HMM Output', 'Marov State')
title('HMM Random Vs. Time N=500');