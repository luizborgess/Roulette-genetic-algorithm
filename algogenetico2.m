clc
#cria pop
#rand("state",2);
A=rand(10,6)>=0.5

#geraçao
for i=1:10
  B=zeros(10,6);
  vetor=sum(A',1);
  soma=sum(vetor)
  vetorfit=vetor/soma;
  #vetor roleta
  vetorcum=cumsum(vetorfit);
  #vetor index seleçao
  vetor_index=roleta(vetorcum);
  
  #crossover
  for i=1:2:9
      array1=A(vetor_index(i),:);
      array2=A(vetor_index(i+1),:);
      crossover=randi([1,6]);
      #prenche matrix b com os vetores trocados de crossover
      B(i,:)=[array1(1:end-crossover) array2(end-crossover+1:end)];
      B(i+1,:)=[array2(1:end-crossover) array1(end-crossover+1:end)];
    endfor
    
  #mutação
  [l,c]=size(B);
  columrand=randi([1,c]);
  linerand=randi([1,l]);
  B(linerand,columrand) = ~B(linerand,columrand);
  
  somaB=sum(sum(B',1))
  melhora_percentagem=somaB*100/soma -100   
  A=B;
  endfor

  #roleta
function i=roleta(vetorcum)
  random=rand(10,1);
  x1=length(vetorcum);
  x1=vetorcum>random;
  i=(length(vetorcum)+1)-sum(x1',1);
endfunction

A