function [CEscore]=CE(varargin)
lrf=varargin{1};%lrf is the local resultant force
lrfnorm=varargin{2};%value
D=varargin{3};
neighborNums=varargin{4};
[rowNums,colNums]=size(D);
distMatrix=pdist2(D,D);
CEscore=zeros(rowNums,1);
for m=1:rowNums
    resultantY=lrf(m,:);
    coreScore=0;
    [a,idx]=sort(distMatrix(m,:));
    currentNorm=lrfnorm(m);
    iterNum=0;
    for k=2:neighborNums
        currentNorm=currentNorm+lrfnorm(idx(k));
        resultantY=resultantY+lrf(idx(k),:);
        deltaDist=D(m,:)-D(idx(k),:);
        if norm(deltaDist)~=0 && lrfnorm(idx(k),:)~=0
            iterNum=iterNum+1;
            coreScore=coreScore+dot(deltaDist,lrf(idx(k),:))/(norm(deltaDist)*lrfnorm(idx(k),:));%compute CE
        end
    end
    coreScore=coreScore/iterNum;
    CEscore(m)=coreScore;
end
end