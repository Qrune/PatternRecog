[y,Fs] = audioread('female.wav');
ft = linspace(0,length(y)/Fs,length(y));
[y1,Fs1] = audioread('music.wav');
ft1 = linspace(0,length(y1)/Fs1,length(y1));
figure(4);
plot(ft,y);
xlabel('Time');
ylabel('Amplitude');
title('Unvoiced Female Speech');
xlim([0.46 0.48]);

band = 13;
figure(5);
[mfccs,spectgram,f,t] = GetSpeechFeatures(y,Fs,0.03,band);
imagesc(t,f,log(spectgram));
colorbar;
axis xy
title('Spectgram for female Speech');
xlabel('Time')
ylabel('Frequency');
annotation('textarrow',[0.25 0.18],[0.45 0.23],'String','Unvoiced'); 
annotation('textarrow',[0.3 0.24],[0.4 0.13],'String','Voiced');

figure(6);
[mfccs1,spectgram1,f1,t1] = GetSpeechFeatures(y1,Fs1,0.03,band);
imagesc(t1,f1,log(spectgram1));
colorbar;
axis xy
title('Spectgram for music signal');
xlabel('Time');
ylabel('Frequency');
annotation('textarrow',[0.2 0.16],[0.53 0.18],'String','Harmonics');
