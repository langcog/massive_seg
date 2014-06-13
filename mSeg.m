%function mSeg(subname)
% segScan (large scale segmentation study)
% Michael C. Frank
% began programming SSN base 9/22/06
% scanner version began programming 9/17/07
% adapted to zipfian massive segmentation expt. 10/21/07

subname = 'lms-2-16-08';
subinfo.subname = 'lms-2-16-08';

settings.num_test_trials = 1000; % at 5sec per trial, should take about an hour
settings.train_isi = 200;
settings.test_isi = .4;
settings.test_wait = .2;
settings.fname = 'data/ms-data.txt';
settings.vowel_len = 175;
settings.cons_len = 25;
settings.chunk_len = 300; % number of seconds in each file

%% initialize
mSegInit;

%% create stims
lex = genLexMSeg;
train_utts = genTrainUttsMSeg(lex,lex.num_tokens);
test_items = genTestItemsMSeg(lex,settings);

save(['data/' subname '-lexicon.mat'],'lex','train_utts','test_items');

%%
synthesizeUttMSeg(train_utts,settings)

%% test
% ws = doScreen;
% for i = 1:settings.num_test_trials
%   aud2afcMSeg(ws,settings,lex,subinfo,test_items(i),...
%     ['Which one sounds like a word in the language?'],settings.fname);
% end;
% 
% MSegEnd; 
% clear screen;