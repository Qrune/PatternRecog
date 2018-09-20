mc = MarkovChain([1; 0], [0.9 0.1 0; 0 0.9 0.1]);

B(1) = GaussD('Mean', 0, 'StDev', 1);
B(2) = GaussD('Mean', 3, 'StDev', 2);

forward(mc,B);