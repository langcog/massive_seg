function synthesizeUttMSegTest(utt,ss)

file = './stim/utt.pho';
fid = fopen(file,'w');


fprintf(fid,'_ 50\n');

for i = 1:utt.syls
  fprintf(fid,'%s %s 100 100\n',utt.c{i},num2str(ss.cons_len));
  fprintf(fid,'%s %s 100 100 \n',utt.v{i},num2str(ss.vowel_len));
end

fprintf(fid,'_ 50\n'); % to avoid pops/clicks
!./mbrola-darwin-ppc us3 ./stim/utt.pho ./stim/utt.wav
playWav('stim/utt.wav');

