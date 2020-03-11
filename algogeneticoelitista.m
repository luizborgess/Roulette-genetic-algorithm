clc
#cria pop
#rand("state",2);
A=rand(10,6)>=0.5
ngen=20;

#geraçao
for i=1:ngen
  B=zeros(10,6);
  vetor=sum(A',1);
  soma=sum(vetor);
  vetorfit=vetor/soma;
  #vetor roleta
  vetorcum=cumsum(vetorfit);
  #vetor index seleçao
  vetor_index=roleta(vetorcum);
  #embaralha indexes
  vetor_index(randperm(length(vetor_index)));
  #crossover
  for j=1:2:9
      array1=A(vetor_index(j),:);
      array2=A(vetor_index(j+1),:);
      crossover=randi([1,6]);
      #prenche matrix b com os vetores trocados de crossover
      B(j,:)=[array1(1:end-crossover) array2(end-crossover+1:end)];
      B(j+1,:)=[array2(1:end-crossover) array1(end-crossover+1:end)];
    endfor
    
  #mutação
  [l,c]=size(B);
  columrand=randi([1,c]);
  linerand=randi([1,l]);
  B(linerand,columrand) = ~B(linerand,columrand);
  
  
  A=elitista(A,B);
  #graph vetor
  yvetor(i)=sum(sum(A,2));
  endfor

  #roleta
function index=roleta(vetorcum)
  random=rand(10,1);
  x1=length(vetorcum);
  x1=vetorcum>random;
  index=(length(vetorcum)+1)-sum(x1',1);
endfunction

function A=elitista(A,B)
  #elitismo pega melhor
  [~,melhor]=max(sum(A,2));
  thebest=A(melhor,:);
  #elitismo substitui melhor no pior
  [~,worst]=min(sum(B,2));
  A=B;
  A(worst,:)=thebest;
endfunction

  A
[~,tam]=max(sum(A,2));
A(tam,:)

plot(1:ngen,yvetor)