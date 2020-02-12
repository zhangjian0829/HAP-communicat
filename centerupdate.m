% function
% center update of K-means

function WW0=centerupdate(WW,rho,A,X)
[N,G]=size(WW);
WW0=zeros(N,G);
num=sum(X,2);%������� Gx1

for g=1:G
    flag=1;
    w0=WW(:,g);
    a=zeros(N,num(g));
    b=zeros(1,num(g));
    ind=find(X(g,:)); %���ص��ǲ�Ϊ0������λ��
    while flag
        for i=1:num(g)
            a(:,i)=2*rho(ind(i))^2*A(:,ind(i))*A(:,ind(i))'*w0;
            b(i)=-rho(ind(i))^2*norm(A(:,ind(i))'*w0)^2-rho(ind(i))^2*N;
        end
        
        [w,eta]=solve_w(a,b);
        
        if norm(w-w0)<1e-2
            flag=0;
        end
        w0=w;
    end
    WW0(:,g)=w;
end