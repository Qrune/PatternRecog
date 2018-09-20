%reference: Sam Lewis

addpath('/Users/yanggao/Documents/PatternReg/PattRecClasses');
addpath('/Users/yanggao/Documents/PatternReg/PattRecClasses/GetSpeechFeatures');
directories = {'Yes', 'No', 'First', 'Second','Alarm', 'TurnOff', 'TurnOn'};
num_words = length(directories);
states = [7 7 7 7 7 7 7];
testSamples = 20;
window = 0.030;
bands = 13;

words = {};

recordingDir = '/Users/yanggao/Documents/PatternReg/PattRecClasses/Recordings/';


features = {};


for word_i = 1:num_words
    
    word_features = [];
    sample_lengths = zeros(num_words, 1);
    
    for sample_i = 1:testSamples
        %read the audio
        [sample,fs] = audioread(strcat(recordingDir, directories{word_i}, '/', int2str(sample_i), '.wav'));
        %get the features and normalise
        mfccs=GetSpeechFeatures(sample, fs, window, bands);
        mfccs = mcNorm(mfccs);
        word_features = [word_features mfccs];
        sample_lengths(sample_i) = size(mfccs, 2);
    end
    
    hmms(word_i) = MakeLeftRightHMM(states(word_i), GaussMixD(), word_features, sample_lengths');
end

save('15hmms', 'hmms');