function wave = tone(freq,dur,fs)

len = fs*dur;
inc = (2*pi)/((1/freq)/(1/fs));
cycle = sin(0:inc:2*pi);
base_wave = repmat(cycle,1,round(freq*dur));
wave = zeros(1,len);
wave(1:min([len length(base_wave)])) = base_wave(1:min([len length(base_wave)]));
