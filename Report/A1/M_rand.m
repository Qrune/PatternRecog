function S=rand(mc,T)
%S=rand(mc,T) returns a random state sequence from given MarkovChain object.
%
%Input:
%mc=    a single MarkovChain object
%T= scalar defining maximum length of desired state sequence.
%   An infinite-duration MarkovChain always generates sequence of length=T
%   A finite-duration MarkovChain may return shorter sequence,
%   if END state was reached before T samples.
%
%Result:
%S= integer row vector with random state sequence,
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%---------------------------------------------
%Code Authors:Yang Gao
%---------------------------------------------

S=zeros(1,T);%space for resulting row vector
nS=mc.nStates;
isFinite = finiteDuration(mc);
%mark if sequences are finite or not 
S(1) = rand(DiscreteD(mc.InitialProb),1);
%set initial 
for i = 2:T
    S(i) = rand(DiscreteD(mc.TransitionProb(S(1,i-1),:)),1); 
    %generate current state base on previous state probiliry 
    if S(i) == nS+1 && isFinite
        %if is finite 
        S = S(1:i-1);
        %cut down the sequence
        break;
    end
    
end
%continue code from here, and erase the error message........


