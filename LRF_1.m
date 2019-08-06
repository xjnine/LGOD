function [lrf,lrfnorm]=LRF_1(varargin)
D=varargin{1};%Dataset
mass1=varargin{2};%mass of each point
neighborNums=varargin{3};%Neighbor number
[rowNums,colNums]=size(D); %Rows and columns of data sets
lrf=zeros(rowNums,colNums);%lrf is the local resultant force
lrfnorm=zeros(rowNums,1);
distMatrix=pdist2(D,D);
for m=1:rowNums
    [a,idx]=sort(distMatrix(m,:));
    for k=2:neighborNums   %
        deltaDist=D(idx(k),:)-D(m,:);
        if norm(deltaDist)~=0
            lrf(m,:)=lrf(m,:)+(deltaDist/norm(deltaDist)/(distMatrix(m,idx(k))*distMatrix(m,idx(k))));
        end
    end
     lrf(m,:)=lrf(m,:)*(1/mass1(m));%compute LRF
     lrfnorm(m)=norm(lrf(m,:));
end
end