addpath('/Users/yanggao/Documents/PatternReg/PattRecClasses/GetSpeechFeatures');
recordingDir = '/Users/yanggao/Documents/PatternReg/PattRecClasses/Recordings/';

directories = {'Yes', 'No', 'First', 'Second', 'Alarm', 'TurnOff', 'TurnOn'};

%words{word_i, sample_i} = sample;


words = {'Yes', 'No', 'First', 'Second', 'Alarm', 'Turn Off', 'Turn On'};

load('15hmms.mat');
[X,S] = rand(hmms(1),300);
figure(2);
plot(X);
hold on;
plot(S);
xlabel('Time');
ylabel('X[t]');
legend('HMM Output', 'Marov State')
title('HMM Random Vs. Time N=500');
[sample,fs] = audioread(strcat(recordingDir, directories{1}, '/', 'rec',int2str(test_i), '.wav'));
        mfccs=GetSpeechFeatures(sample, 22050, 0.030, 13);
        mfccs = mcNorm(mfccs);
[S,logP] = viterbi(hmms(1),mfccs);
figure(1);
plot(mfccs);
hold on;
plot(S);
xlabel('Time');
ylabel('X[t]');
legend('HMM Output', 'Marov State')
title('Generate');