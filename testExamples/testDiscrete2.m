function [hNew,hGen]=testDiscrete%test training an array of DiscreteD objects%Arne Leijon 2005-10-26 tested%make a simple DiscreteD distributionhGen=DiscreteD([3 3 1 1]);%Make a big training data sequence:xTraining=rand(hGen,3000);%training datahNew=init(repmat(DiscreteD,5,1),xTraining);