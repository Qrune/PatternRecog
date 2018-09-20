

addpath('/Users/yanggao/Documents/PatternReg/PattRecClasses');
addpath('/Users/yanggao/Documents/PatternReg/PattRecClasses/GetSpeechFeatures');


load('15hmms.mat');

tsample = audiorecorder(22050,16,1);
disp('Please speak in 2 second');
record(tsample);
pause(2);
play(tsample);
stop(tsample);

words = {'Yes', 'No', 'First', 'Second', 'Alarm', 'Turn Off', 'Turn On'};
inputWord = getaudiodata(tsample);
mfccs=GetSpeechFeatures(inputWord, 22050, 0.030, 13);
mfccs = mcNorm(mfccs);
lP = logprob(hmms, mfccs);
plot(lP);
set(gca,'XTickLabel', words)

[c, i] = max(lP);

disp(strcat(['Most likely word is ' words{i}]));