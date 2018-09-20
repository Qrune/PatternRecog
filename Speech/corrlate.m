[y,Fs] = audioread('female.wav');
ft = linspace(0,length(y)/Fs,length(y));
[y1,Fs1] = audioread('music.wav');
figure(9)
subplot(1,2,1);
band = 13;
[mfccs,spectgram,f,t] = GetSpeechFeatures(y,Fs,0.03,band);
imagesc(t,f,abs(corr(log(spectgram))));
colorbar;
axis xy
title('Spectgram for female Speech');
xlabel('Time')
ylabel('Frequency');
colormap gray;
subplot(1,2,2);
mfccs_norm = normr(mfccs);
imagesc(t,f,abs(corr(mfccs_norm)));
axis xy;
colorbar;
xlabel('Cepstral Coefficient')
ylabel('Cepstral Coefficient');
title('Cepstrogram for the femal Speech');
colormap gray;

