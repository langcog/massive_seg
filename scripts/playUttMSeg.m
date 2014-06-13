function playUttMSeg(utt,settings)

file_num = 1;

file = ['./stim/utt.pho'];
fid = fopen(file,'w');

fprintf(fid,'_ 50\n');


% translate into a .pho file from just a written string
for i = 1:utt.syls
  fprintf(fid,'%s %s 100 100\n',utt.c{i},num2str(settings.cons_len));
  fprintf(fid,'%s %s 100 100 \n',utt.v{i},num2str(settings.vowel_len));
end

!./mbrola-darwin-ppc us3 ./stim/utt.pho ./stim/utt.wav
playWav('./stim/utt.wav');
fclose(fid);
