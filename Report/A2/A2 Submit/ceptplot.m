[y,Fs] = audioread('female.wav');
ft = linspace(0,length(y)/Fs,length(y));
[y1,Fs1] = audioread('music.wav');
ft1 = linspace(0,length(y1)/Fs1,length(y1));
figure(7);
subplot(2,2,1);
band = 13;
[mfccs,spectgram,f,t] = GetSpeechFeatures(y,Fs,0.03,band);
imagesc(t,f,log(spectgram));
colorbar;
axis xy
title('Spectgram for female Speech');
xlabel('Time')
ylabel('Frequency');
subplot(2,2,2);
mfccs_norm = normr(mfccs);
imagesc(t,f,mfccs_norm);
axis xy;
colorbar;
xlabel('Time');
ylabel('Frequency(MFCCS)');
title('Cepstrogram for the femal Speech');
[y2,Fs2] = audioread('male.wav');
[mfccs2,spectgram2,f2,t2] = GetSpeechFeatures(y2,Fs2,0.03,band);
subplot(2,2,3);
imagesc(t2,f2,log(spectgram2));
colorbar;
axis xy
title('Spectgram for male Speech');
xlabel('Time')
ylabel('Frequency');
subplot(2,2,4);
mfccs2_norm = normr(mfccs2);
imagesc(t2,f2,mfccs2_norm);
axis xy;
colorbar;
title('Cepstrogram for the male Speech')
xlabel('Time');
ylabel('Frequency(MFCCS)');


figure(8)
subplot(1,2,1);
[mfccs1,spectgram1,f1,t1] = GetSpeechFeatures(y1,Fs1,0.03,band);
imagesc(t1,f1,log(spectgram1));
colorbar;
axis xy
title('Spectgram for music Speech');
xlabel('Time')
ylabel('Frequency');
subplot(1,2,2);
mfccs1_norm = normr(mfccs1);
imagesc(t1,f1,mfccs1_norm);
axis xy;
colorbar;
xlabel('Time')
ylabel('Frequency(MFCCS)');
title('Cepstrogram for the music Speech');
