% Program 8.9 Backward difference method with Newton iteration
%             for the Brusselator 
% input: space region [xl,xr]x[yb,yt], time interval [t0,te], 
%    M,N space steps in x and y directions, tsteps time steps 
% output: solution mesh [x,y,p,q]
% Example usage: [x,y,p,q]=brusselator(0,40,0,40,0,20,40,40,20,K);
function teq=brusselatorT(xl,xr,yb,yt,tb,te,M,N,tsteps,K)
Dp=1;Dq=8;C=4.5;
fp=@(x,y) 1+cos(pi*x).*cos(pi*y); %C+0.1;
fq=@(x,y) 2+cos(2*pi*x).*cos(2*pi*y); %K/C+0.2;
delt=(te-tb)/tsteps;
m=M+1;n=N+1;mn=m*n;mn2=2*mn;
h=(xr-xl)/M;k=(yt-yb)/N;
x=linspace(xl,xr,m);y=linspace(yb,yt,n);
w=1;
teq = 0;
for i=1:m          %Define initial conditions
  for j=1:n
    p(i,j)=fp(x(i),y(j));
    q(i,j)=fq(x(i),y(j));
  end
end
for tstep=1:tsteps
    tstep
  v=[reshape(p,mn,1);reshape(q,mn,1)];
  pold=p;qold=q;
  for it=1:3
    DF1=zeros(mn2,mn2);DF3=zeros(mn2,mn2);
    b=zeros(mn2,1);
    for i=2:m-1
      for j=2:n-1
        DF1(i+(j-1)*m,i-1+(j-1)*m)=-Dp/h^2;
        DF1(i+(j-1)*m,i+(j-1)*m)= Dp*(2/h^2+2/k^2)+K+1+1/(1*delt);
        DF1(i+(j-1)*m,i+1+(j-1)*m)=-Dp/h^2;
        DF1(i+(j-1)*m,i+(j-2)*m)=-Dp/k^2;
        DF1(i+(j-1)*m,i+j*m)=-Dp/k^2;
        b(i+(j-1)*m)=-pold(i,j)/(1*delt)-C;      
        DF1(mn+i+(j-1)*m,mn+i-1+(j-1)*m)=-Dq/h^2;
        DF1(mn+i+(j-1)*m,mn+i+(j-1)*m)= Dq*(2/h^2+2/k^2)+1/(1*delt);
        DF1(mn+i+(j-1)*m,mn+i+1+(j-1)*m)=-Dq/h^2;
        DF1(mn+i+(j-1)*m,mn+i+(j-2)*m)=-Dq/k^2;
        DF1(mn+i+(j-1)*m,mn+i+j*m)=-Dq/k^2;
        DF1(mn+i+(j-1)*m,i+(j-1)*m)=-K;
        DF3(i+(j-1)*m,i+(j-1)*m)=-2*p(i,j)*q(i,j);
        DF3(i+(j-1)*m,mn+i+(j-1)*m)=-p(i,j)^2;
        DF3(mn+i+(j-1)*m,i+(j-1)*m)=2*p(i,j)*q(i,j);
        DF3(mn+i+(j-1)*m,mn+i+(j-1)*m)=p(i,j)^2;
        b(mn+i+(j-1)*m)=-qold(i,j)/(1*delt);  
      end
    end
    for i=1:m   % bottom and top Neumann conditions
      j=1;DF1(i+(j-1)*m,i+(j-1)*m)=3;
      DF1(i+(j-1)*m,i+j*m)=-4;
      DF1(i+(j-1)*m,i+(j+1)*m)=1;
      j=n;DF1(i+(j-1)*m,i+(j-1)*m)=3;
      DF1(i+(j-1)*m,i+(j-2)*m)=-4;
      DF1(i+(j-1)*m,i+(j-3)*m)=1;
      j=1;DF1(mn+i+(j-1)*m,mn+i+(j-1)*m)=3;
      DF1(mn+i+(j-1)*m,mn+i+j*m)=-4;
      DF1(mn+i+(j-1)*m,mn+i+(j+1)*m)=1;
      j=n;DF1(mn+i+(j-1)*m,mn+i+(j-1)*m)=3;
      DF1(mn+i+(j-1)*m,mn+i+(j-2)*m)=-4;
      DF1(mn+i+(j-1)*m,mn+i+(j-3)*m)=1;
    end
    for j=2:n-1   %left and right
      i=1;DF1(i+(j-1)*m,i+(j-1)*m)=3;
      DF1(i+(j-1)*m,i+1+(j-1)*m)=-4;
      DF1(i+(j-1)*m,i+2+(j-1)*m)=1;
      i=m;DF1(i+(j-1)*m,i+(j-1)*m)=3;
      DF1(i+(j-1)*m,i-1+(j-1)*m)=-4;
      DF1(i+(j-1)*m,i-2+(j-1)*m)=1; 
      i=1;DF1(mn+i+(j-1)*m,mn+i+(j-1)*m)=3;
      DF1(mn+i+(j-1)*m,mn+i+1+(j-1)*m)=-4;
      DF1(mn+i+(j-1)*m,mn+i+2+(j-1)*m)=1;
      i=m;DF1(mn+i+(j-1)*m,mn+i+(j-1)*m)=3;
      DF1(mn+i+(j-1)*m,mn+i-1+(j-1)*m)=-4;
      DF1(mn+i+(j-1)*m,mn+i-2+(j-1)*m)=1; 
    end
    DF=DF1+DF3;
    F=(DF1+DF3/3)*v+b;
    v=v-DF\F;
    p=reshape(v(1:mn),m,n);q=reshape(v(mn+1:mn2),m,n);
    if teq == 0;
        for i=1:m
            for j=1:n
                if abs(p(i,j)-C)<.01
                    teq=tstep*delt;
                end
            end
        end
    end
  end
  
  
  end
  teq;
end