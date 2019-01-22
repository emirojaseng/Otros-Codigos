function [choice_prob] = decision(n,maxcomp, prior)
%n= size of menu
%maxcomp= number of comparisons allowed
%prior = the prior distribution for the linear orders;

P=perms(1:n); %All possible linear orders

%----------Orders the list with r movements----
for i=1:factorial(n)
    pref=P(i,:); 
    %order the i-th preference with selection sort
    ncomp=0;
    j=1;
    while(ncomp<maxcomp && j<n)
        if(pref(1)<=pref(1+j))
            %swap
            temp=pref(1);
            pref(1)=pref(1+j);
            pref(1+j)=temp;
        end
        ncomp=ncomp+1;
        j=j+1;
    end
    P(i,:)=pref;
end
%----------------------------------------------

chosen=P(:,1);  %Only top choices

%Calculates the choice probabilites.
choice_prob=zeros(n,1);
for(i=1:n)
    choice_prob(i)=sum(prior(chosen==i));
end
end

