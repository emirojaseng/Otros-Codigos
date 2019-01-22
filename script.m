n=9;
maxcomp=2;

    %uniform
    prior=ones(factorial(n),1)/factorial(n);
   
    %binary choice
    %prior=zeros(factorial(n),1); prior(randsample(factorial(n),2))=[1/3,2/3];
    
    %ample recomendation on some mediocre thing
    %prior=ones(factorial(n),1)/(2*(factorial(n-1)*(n-1)));
    %prior(floor(n/2)*factorial(n-1)+1:(floor(n/2)+1)*factorial(n-1))=1/(2*factorial(n-1));
    
    %ample recomendation on next best thing
    %prior=ones(factorial(n),1)/(2*(factorial(n-1)*(n-1)));
    %prior(factorial(n-1)+1:2*factorial(n-1))=1/(2*factorial(n-1));
    
    %random recomendations
%     r=randsample(n,n)/sum(1:n);
%     prior=[];
%     for i=1:n
%         prior=[prior; repmat(r(i)/factorial(n-1),factorial(n-1),1)];
%     end
    
    %random distribution
    %prior=abs(randn(factorial(n),1)); prior=prior/sum(prior);
    
choice_prob=decision(n,maxcomp, prior)
bar(choice_prob);