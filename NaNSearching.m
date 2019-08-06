function[Sup,NN,RNN,NNN,nb,A]=NaNSearching(varargin)
D=varargin{1};
r=1;
nb=zeros(size(D,1),1);
C=cell(size(D,1),1);
NN=cell(size(D,1),1);%初始化每个点的KNN邻居
RNN=cell(size(D,1),1);%初始化每个点的RKNN邻居
NNN=cell(size(D,1),1);%是NN和RNN的交集，也就每个点的
A=pdist2(D,D);
Numb1=0;
Numb2=0;
for ii=1:size(D,1)
   [sa,index]=sort(A(:,ii));
   C{ii}=[sa,index];
end
while(r<size(D,1))
 for kk=1:size(D,1)
     x=kk;
     y=C{x}(r+1,2);
     nb(y)= nb(y)+1;
     NN{x}=[NN{x},y];
     RNN{y}=[RNN{y},x];
 end
    Numb1=sum(nb==0);
    if Numb2~=Numb1
        Numb2=Numb1;
    else
       break; 
    end
    r=r+1;
end
for jj=1:size(D,1)
NNN{jj}=intersect(NN{jj},RNN{jj});
end
Sup=r;
end