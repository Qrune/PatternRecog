addpath('/Users/yanggao/Documents/PatternReg/PattRecClasses');
addpath('/Users/yanggao/Documents/PatternReg/PattRecClasses/GetSpeechFeatures');
recordingDir = '/Users/yanggao/Documents/PatternReg/PattRecClasses/Recordings/';

directories = {'Yes', 'No', 'First', 'Second', 'Alarm', 'TurnOff', 'TurnOn'};

%words{word_i, sample_i} = sample;


words = {'Yes', 'No', 'First', 'Second', 'Alarm', 'Turn Off', 'Turn On'};
for c_word = 1:7
    correct = 0;
    for test_i = 1:5
        [sample,fs] = audioread(strcat(recordingDir, directories{c_word}, '/', 'rec',int2str(test_i), '.wav'));
        mfccs=GetSpeechFeatures(sample, 22050, 0.030, 13);
        mfccs = mcNorm(mfccs);
        lP = logprob(hmms, mfccs);
        [c, i] = max(lP);
        if (i==c_word)
            correct = correct +1;
        end
        disp(strcat(['Most likely word is ' words{i}]));
    end
    disp(strcat('Correct rate for word',{' '}, words{c_word}," is ", num2str(correct/5)));
end
lP = logprob(hmms, mfccs);
