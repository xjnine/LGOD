function [index,temp,Sup,NN,NaN,RNN,NNN,NaN2,Neicount]=main_for_loop(varargin) %Noise detection combined with NaN and LRF
D=varargin{1};
ii=varargin{2};

[Sup,NN,RNN,NNN,nb,A,NaN,NaN2,Neicount]=NaNSearching_Dy(D);
kk=ii;

[mass,lrfnorm,lrfnorm_1,temp,index2]=test(D,kk,Neicount);
index=[];

c=ceil(mean(Neicount)+1*std(Neicount));
d=c-1;
index1=[];
for i=1:size(D,1)
    if (numel(NaN{i})<d)
        index1=[index1,i];
    end
end
% index=union(index1,index2);
index=index2;
% 
% plot(D(:,1),D(:,2),'.k');
% hold on
% plot(D(index1,1),D(index1,2),'*g');
% hold on
% plot(D(index2,1),D(index2,2),'*r');

% scatter3(D(:,1),D(:,2),D(:,3));
% hold on
% scatter3(D(index1,1),D(index1,2),D(index1,3),'*','g');
% 
% scatter3(D(index2,1),D(index2,2),D(index2,3),'*','r');

end