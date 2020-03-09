clc
#cria pop
A=rand(10,6)>=0.5;

#gen for
#for i=1:10
#endfor

vetor=sum(A',1);
soma=sum(vetor)
vetorfit=vetor/soma;
vetorcum=cumsum(vetorfit);

function index= selector(vetorcum)
  random=rand;
  for i=1:length(vetorcum)
    if vetorcum(i)>random
      #escolhido=vetorcum(i)
      index=i;
      break
    endif
  endfor
endfunction

B=zeros(10,6);
for i=1:10
  v1=selector(vetorcum);
  v2=selector(vetorcum);
  array1=A(v1,:);
  array2=A(v2,:);
  crossover=randi([1,6]);
  #prenche matrix b com os vetores trocados de crossover
  B(i,:)=[array1(1:end-crossover) array2(end-crossover+1:end)];
  B(i+1,:)=[array2(1:end-crossover) array1(end-crossover+1:end)];
  i=i+2;
endfor

A
B
somaB=sum(sum(B',1))
melhora_percentagem=somaB*100/soma -100 
