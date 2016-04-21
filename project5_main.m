%Part 1 of the Project
clearvars
rmse=zeros(1,12);
for i=1:12
    x=1:200;
    original=cos((1:2^(12))*2*pi*64*i/2^(13));
    new=simplecodec(original);
    for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=200
            original2(j)=.3*original(j+32)/max(abs(original));
            new2(j)=new(j);
        end
    end
    rmse(i)=norm(error);
    figure(1);
    subplot(2,6,i);
    plot(x,original2,x,new2);
    title(strcat('n= ', num2str(i), ' RMSE= ',num2str(rmse(i))));
    pause(1);
    
end

%Part 2 of the Project
%We are using simplecodec2() with the windowing function
clearvars
rmse=zeros(1,12);
for i=1:12
    x=1:200;
    original=cos((1:2^(12))*2*pi*64*i/2^(13));
    new=simplecodec2(original);
    for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=200
            original2(j)=.3*original(j+32)/max(abs(original));
            new2(j)=new(j);
        end
    end
    rmse(i)=norm(error);
    figure(2);
    subplot(2,6,i);
    plot(x,original2,x,new2);
    title(strcat('n= ', num2str(i), ' RMSE= ',num2str(rmse(i))));
    pause(1);
    
end

%Part 4 of the project
clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(5/4)/2^(13));
new=simplecodec(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(3);
subplot(2,3,1);
plot(x,original1,x,new1);
title(strcat('Major third non window, ','RMSE= ',num2str(norm(error))));
pause(1);

clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(5/4)/2^(13));
new=simplecodec2(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(3);
subplot(2,3,2);
plot(x,original1,x,new1);
title(strcat('Major third window, ','RMSE= ',num2str(norm(error))));
pause(1);

clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(4/3)/2^(13));
new=simplecodec(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(3);
subplot(2,3,3);
plot(x,original1,x,new1);
title(strcat('Fourth non window, ','RMSE= ',num2str(norm(error))));
pause(1);

clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(4/3)/2^(13));
new=simplecodec2(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(3);
subplot(2,3,4);
plot(x,original1,x,new1);
title(strcat('Fourth window, ','RMSE= ',num2str(norm(error))));
pause(1);

clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(3/2)/2^(13));
new=simplecodec(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(3);
subplot(2,3,5);
plot(x,original1,x,new1);
title(strcat('Fifth non window, ','RMSE= ',num2str(norm(error))));
pause(1);

clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(3/2)/2^(13));
new=simplecodec2(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(3);
subplot(2,3,6);
plot(x,original1,x,new1);
title(strcat('Fifth window, ','RMSE= ',num2str(norm(error))));
pause(1);

%Part4 Continued
clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(6/5)/2^(13))+cos((1:2^(12))*2*pi*220*(3/2)/2^(13));
new=simplecodec(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(4);
subplot(2,2,1);
plot(x,original1,x,new1);
title(strcat('Minor chord non window, ','RMSE= ',num2str(norm(error))));
pause(1);

clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(6/5)/2^(13))+cos((1:2^(12))*2*pi*220*(3/2)/2^(13));
new=simplecodec2(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(4);
subplot(2,2,2);
plot(x,original1,x,new1);
title(strcat('Minor Chord window, ','RMSE= ',num2str(norm(error))));
pause(1);

clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(5/4)/2^(13))+cos((1:2^(12))*2*pi*220*(3/2)/2^(13));
new=simplecodec(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(4);
subplot(2,2,3);
plot(x,original1,x,new1);
title(strcat('Major chord non window, ','RMSE= ',num2str(norm(error))));
pause(1);

clearvars
original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(5/4)/2^(13))+cos((1:2^(12))*2*pi*220*(3/2)/2^(13));
new=simplecodec2(original);
x=1:400;
for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=400
            original1(j)=.3*original(j+32)/max(abs(original));
            new1(j)=new(j);
        end
end

figure(4);
subplot(2,2,4);
plot(x,original1,x,new1);
title(strcat('Major chord window, ','RMSE= ',num2str(norm(error))));
pause(1);


%Last figure for part 4
clearvars
rmse=zeros(1,12);
for i=2:7
    x=1:200;
    original=cos((1:2^(12))*2*pi*220/2^(13))+cos((1:2^(12))*2*pi*220*(5/4)/2^(13))+cos((1:2^(12))*2*pi*220*(3/2)/2^(13));
    new=simplecodec4(original,i);
    for j=1:4032
        error(j)=new(j)-.3*original(j+32)/max(abs(original));
        if j<=200
            original2(j)=.3*original(j+32)/max(abs(original));
            new2(j)=new(j);
        end
    end
    rmse(i-1)=norm(error);
    figure(5);
    subplot(2,3,i-1);
    plot(x,original2,x,new2);
    title(strcat('bits= ', num2str(i), ' RMSE= ',num2str(rmse(i-1))));
    pause(1);
    
end

%Part 5 of Project
%Cool ending to the piece
clearvars
[song, Fs]=audioread('project5_originalPersichetti.mp3');
original=zeros(486144,1);
for i=1:length(original)
    original(i)=song(i,1)+song(i,2);
end
new=simplecodec3(original);
x=47181:48680;
for j=1:48680
        error(j)=(new(j)-.3*original(j+32)/max(abs(original)));
end
original2=1:1500;
new2=1:1500;
for i=1:1500
    original2(i)=.3*original(i+32+47180)/max(abs(original));
    new2(i)=new(i+47180);
end
figure(6);
plot(x,original2,x,new2);
title(strcat('Final chord in Pageant by Vincent Persichetti, ', ' RMSE= ',num2str(norm(error))));