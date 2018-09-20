[y,Fs] = audioread('female.wav');
ft = linspace(0,length(y)/Fs,length(y));
plot(ft,y);
xlabel('Time');
ylabel('Amplitude');
title('Femal Speech');

figure(2);
[y1,Fs1] = audioread('music.wav');
ft1 = linspace(0,length(y1)/Fs1,length(y1));
plot(ft1,y1);
xlabel('Time');
ylabel('Amplitude');
title('Music Speech');

figure(3);
plot(ft,y);
xlabel('Time');
ylabel('Amplitude');
title('Voiced Female Speech');
xlim([0.6 0.62]);

