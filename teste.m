clc,clear
## for teste versus vector operation

#rand("state",1);
A=rand(10,6)>=0.5
vetor=sum(A',1)
soma=sum(vetor)
vetorfit=vetor/soma
vetorcum=cumsum(vetorfit)
random=rand(10,1)
#random=rand

tic,
  for i=1:length(vetorcum)
      if vetorcum(i)>random
        #escolhido=vetorcum(i)
        index=i;
        break
      endif
  endfor
disp(['loop version time: ' num2str(toc)]) 

tic,
x1=length(vetorcum);
x1=vetorcum>random
index=11-sum(x1',1)
disp(['compare replace all version time: ' num2str(toc)])

##x = zeros(10,1);
##y = rand(size(x))
##z = rand(size(x))
##x2 = zeros(10,1)
##x2( y(:,1)>=z(:,1), 1 ) = 1
##i = find(x2==1)


