% graph lexicon

figure(1)
clf
subplot(1,2,1)
set(gca,'FontSize',18)
hist(lex.freqs);
xlabel('word frequency')



subplot(1,2,2)
set(gca,'FontSize',18)
hist(poissrnd(2,lex.num_types,1)+1,6);
xlabel('word length')
