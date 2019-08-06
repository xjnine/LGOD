function [mass1]=mass(varargin)
neighborNums=varargin{1};%Neighbor number
D=varargin{2};%Dataset
rowNums=size(D,1);%dataset rownumbers
mass1=zeros(rowNums,1);
distMatrix=pdist2(D,D);%Distance matrix
for ii=1:rowNums
    [a]=sort(distMatrix(ii,:));
    mass1(ii,1)=1/sum(a(2:neighborNums));%compute mass for each data i;
end
end