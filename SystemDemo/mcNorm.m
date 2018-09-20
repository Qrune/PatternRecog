function [mfccs] = mcNorm(mfccs)
for i=1:13
    avg = mean(mfccs(i,:));
    std_dev = std(mfccs(i, :));
    mfccs(i, :) = (mfccs(i, :) - avg)/std_dev; 
    %normalise
end