clc
#cria pop
#rand("state",2);
A=rand(10,6)>=0.5

#for geraçao
for i=1:10
  B=zeros(10,6);
  vetor=sum(A',1);
  soma=sum(vetor)
  vetorfit=vetor/soma;
  vetorcum=cumsum(vetorfit);
  vetor_index=roleta(vetorcum);
  
  #for mutaçao
  for i=1:2:9
      array1=A(vetor_index(i),:);
      array2=A(vetor_index(i+1),:);
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
  random=rand(10,1);
  x1=length(vetorcum);
  x1=vetorcum>random;
  i=11-sum(x1',1);
endfunction

A