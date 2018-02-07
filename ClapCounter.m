
prompt = 'What is the M value? ';
M = input(prompt);
 % In this loop I'm looking for the sound files that are realted to M.
 % By reading them, I'm making audio processing so that I can find the
 % number of claps. My algorithm looks for mean of an array and then set
 % some value as threshold. Therefore by iterating over indexes , I should
 % be able to observe if there is a clap occured in sound file.
 % 2-2 has 5 claps.
 % 2-1 has 1 clap
 % Other ones are default files.
for i=1:M
    for t=1:2
    stemp = strcat(num2str(-t),'.wav');
    s = strcat(num2str(i),stemp);
    hfile = s;
    [y, Fs] = audioread(hfile);
    clapcount=0;
    head = -1250;
    firstDim = length(y);
    Arr = y(1:firstDim, 1:1);
    secondDim = length(Arr);
    average = mean(Arr);
    threshold = average+0.2;
for j = 1:secondDim
    if Arr(j) > threshold
        cur = head+ 1250;
       if j > cur
          clapcount = clapcount + 1;
       head=j;
       end
    end
end
fprintf('The number of claps counted for the file "%s" is %d\n' ,s , clapcount);
    end
end

