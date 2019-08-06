function[t1,t2,t3,t4,t5,t6,t7,t8,t9,t10]=findStatistic(varargin)
D=varargin{1};
t1=max(D);
t2=min(D);
t3=mean(D);
t4=median(D);
t5=mode(D);
t6=std(D);
t7=var(D);
t8=t1-t2;
t9=kurtosis(D);
t10=skewness(D);

end