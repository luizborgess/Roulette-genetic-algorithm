clc,clear
#cria pop
rand("state",2);
A=rand(10,6)>=0.5


for i=1:10
  B=zeros(10,6);
  vetor=sum(A',1);
  soma=sum(vetor)
  vetorfit=vetor/soma;
  vetorcum=cumsum(vetorfit);
  for i=1:2:9
      v1=roleta(vetorcum);
      v2=roleta(vetorcum);
      array1=A(v1,:);
      array2=A(v2,:);
      crossover=randi([1,6]);
      #prenche matrix b com os vetores trocados de crossover
      B(i,:)=[array1(1:end-crossover) array2(end-crossover+1:end)];
      B(i+1,:)=[array2(1:end-crossover) array1(end-crossover+1:end)];
    endfor
    
  somaB=sum(sum(B',1))
  melhora_percentagem=somaB*100/soma -100   
  A=B;
  endfor

function i=roleta(vetorcum)
  random=rand;
  x1=length(vetorcum);
  x1=vetorcum>random;
  i=find(x1==1,1);
endfunction

A
