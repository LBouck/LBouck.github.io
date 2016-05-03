i=1;S=linspace(4,6.666,30);
for K=S
    T(i)=brusselatorT(0,10,0,10,0,50,20,20,50,K);
    i=i+1;
end

figure(1);
plot(S,T)
xlabel('K Value');
ylabel('Equilibrium T');
title('K vs. Equilibrium T');