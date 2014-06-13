ss.num_test_trials = 100; % at 5sec per trial, should take about an hour
ss.train_isi = 200;
ss.test_isi = .4;
ss.test_wait = .2;
ss.fname = 'data/ms-data.txt';
ss.vowel_len = 200;
ss.cons_len = 25;

lex = genLexMSeg;

%%
c = 1;
for i = 1:length(lex.consonants)
  for j = 1:length(lex.vowels)
    utts(c).syls = 1;
    utts(c).c{1} = lex.consonants{i};
    utts(c).v{1} = lex.vowels{j};
    c = c+1;
  end
end

%%


for i = 330:length(utts)
  synthesizeUttMSegTest(utts(i),ss);
%   good(i) = num2str(input(['was ' utts(i).c{1} utts(i).v{1} ' good? '] ...
%     ,'s'));
  disp([utts(i).c{1} utts(i).v{1}]);
end

