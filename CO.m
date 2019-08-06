function [COscore]=CO(varargin)
lrf=varargin{1};
%lrfnorm=varargin{2};%value
D=varargin{2};
neighborNums=varargin{3};
[rowNums,colNums]=size(D);
distMatrix=pdist2(D,D);
COscore=zeros(rowNums,1);
for m=1:rowNums
    coreScore=0;
    [a,idx]=sort(distMatrix(m,:));
    for k=2:neighborNums
        coreScore=coreScore+dot(lrf(m,:),lrf(idx(k),:));%compute CO
    end
   COscore(m)=coreScore;
end
end