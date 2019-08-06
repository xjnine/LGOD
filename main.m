function []=main(varargin)
D=varargin{1};
[mass,lrfnorm,lrfnorm_1,index2]=test(D);
[CEscore_1,temp,index1]=test_1(D);
plot(D(:,1),D(:,2),'.b');
hold on
plot(D(index1,1),D(index1,2),'.r');
hold on
plot(D(index2,1),D(index2,2),'.r');
end