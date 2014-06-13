mSegInit
load('data/small_lexicons/mcf-10-24-07-small_lex.mat');

settings.num_test_trials = 400; % at 5sec per trial, should take about an hour
settings.train_isi = 200;
settings.test_isi = .4;
settings.test_wait = .2;
settings.fname = 'data/ms-data.txt';
settings.vowel_len = 175;
settings.cons_len = 25;
settings.chunk_len = 300; % number of seconds in each file

utts = genTrainUttsMSeg(lex,settings.num_test_trials);

%%

for i = 1:length(utts)
  cans{i} = [];
  for j = 1:length(utts(i).word_lens)-1
    cans{i} = [cans{i} zeros(1,utts(i).word_lens(j)-1) 1];
  end
  cans{i} = [cans{i} zeros(1,utts(i).word_lens(end)-1)];
end

ws = doScreen;

tic

broken = [];
for i = 1:length(utts)
  try
    resp{i} = segTest(ws,utts(i),settings);
  catch
    broken = [broken i];
    resp{i} = zeros(size(cans{i}));
  end
  WaitSecs(1);
end

toc
clear screen

%%

save('data/controls/mcf-matched--5-3-09-test.mat','resp','utts','cans','broken');

%% score

for i = setdiff(1:length(resp),broken)
  rresp{i} = resp{i}(randperm(length(resp{i})));
  hits(i) = sum(resp{i}==1&cans{i}==1);
  false_alarms(i) = sum(resp{i}==1 & cans{i}==0);
  misses(i) = sum(resp{i}==0 & cans{i}==1);
  rhits(i) = sum(rresp{i}==1&cans{i}==1);
  rfalse_alarms(i) = sum(rresp{i}==1 & cans{i}==0);
  rmisses(i) = sum(rresp{i}==0 & cans{i}==1);
end

precision = sum(hits) / (sum(hits) + sum(false_alarms));
recall = sum(hits) / (sum(hits) + sum(misses));
rprecision = sum(rhits) / (sum(rhits) + sum(rfalse_alarms));
rrecall = sum(rhits) / (sum(rhits) + sum(rmisses));

f = harmmean([precision recall]);
r_f = harmmean([rprecision rrecall]);

ps = hits ./ (hits + false_alarms);
rs = hits ./ (hits + misses);
ps(isnan(ps)) = 0;
rs(isnan(rs)) = 0;
fs = harmmean([ps' rs'],2);


%%
subplot(2,1,1)
set(gca,'FontSize',20)
bar([f r_f])
ylabel('F score');
set(gca,'XTickLabel',{'my data','baseline'});
axis([0 3 0 1])

subplot(2,1,2)
set(gca,'FontSize',20)
ts = 1:length(fs);
p = polyfit(1:length(fs),fs',2);
ps = polyval(p,ts)
plot(1:length(fs),fs,ts,ps)
legend('by trial F score','best polynomial fit')
ylabel('F score');
xlabel('Trials');