function R=rand(pD,nData)
%R=rand(pD,nData) returns random scalars drawn from given Discrete Distribution.
%
%Input:
%pD=    DiscreteD object
%nData= scalar defining number of wanted random data elements
%
%Result:
%R= row vector with integer random data drawn from the DiscreteD object pD
%   (size(R)= [1, nData]
%
%----------------------------------------------------
%Code Authors:Yang Gao
%----------------------------------------------------

if numel(pD)>1
    error('Method works only for a single DiscreteD object');
end
%initial the return value 
R = zeros(1,nData);
%create distrubution function from probmass
ProbD = cumsum(pD.ProbMass);
for i=1:nData
    seed = rand(1);
    for j=1:size(ProbD)
        %go throw all the interval 
        if (seed < ProbD(j))
            R(i) = j;
            break;
        end
    end
end

