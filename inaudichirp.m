% the start and end frequencies of one chirp signal
StartFreq=18000;
EndFreq=20000;
% sampling rate of the signal
SamplingRate=48000;
% duration of a chirp signal
duration=0.1;
% single signal generation
s_signal=chirp(0:1/SamplingRate:duration,StartFreq,duration,EndFreq);
% connect single signal to generate a long-period signal, e.g., a 10s signal
signal=[];
for i=1:10/duration
  signal=[signal s_signal];
end
% filter the out of band signals. Note that bandpass can be design with filterDesigner in Matlab
signal=filter(bandpass,signal);
% write the signal to a wav file
audiowrite('signal.wav',signal,SamplingRate);
