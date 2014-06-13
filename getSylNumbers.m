function train = getSylNumbers(train_utts,lex)

syls = {};
for i = 1:length(lex.consonants)
  for j = 1:length(lex.vowels)
    syls = [syls [lex.consonants{i} lex.vowels{j}]];
  end
end

%% make everything into numbers, it's easier
for i = 1:length(train_utts)
  for j = 1:train_utts(i).syls
    train{i}(j) = find(strcmp(syls,[train_utts(i).c{j} train_utts(i).v{j}]));
  end
end