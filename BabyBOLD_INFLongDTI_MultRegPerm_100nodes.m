%ANALYSIS WTIH INFANT AGE AS COVARIATE
%specify the desired covariates; link to source file (e.g., AF) and specify
%the column they are located in
cov=StimQ(:,1); %this specifies age as the covariate

%Multiple regression analysis
for i=1:2 %specifies each psychometric variable
    for node=1:100 
        tempcov=cov; %specifies our covariate 
        tempcov(:,2)=StimQ(:,(node+3)); %specifies the nodes with the covariate; 
        tempcov=[ones(size(tempcov,1),1) tempcov]; %specifies the intercept for the full model
        
        tempb=regress(StimQ(:,(i+1)),tempcov); %command to run the regression
        
        
        
        
        
        bpartial(i,node)=tempb(3,1); %this runs the regression extracting the beta value (predictors)
        
        clear temp*;
        
        
        
    end
    
    
    
    
    
end



%Permutation analysis
for  i=1:2
   performance= StimQ(:,(i+1));
   for permutation=1:5000 %specifies the number of permutations
      performanceshuffle(:,permutation)=shuffle(performance); 
      
        for node=1:100
            
           tempcov=StimQ(:,1);
           tempcov(:,2)=StimQ(:,(node+3)); %also change when incorporating HLE variables to align with above (see below)

            tempcov=[ones(size(tempcov,1),1) tempcov];
        
            tempb=regress(performanceshuffle(:,permutation),tempcov);
        
        
        
        
        
           perbage(permutation,node)=tempb(3,1); %also change here for HLE variables (see below)
  
        
          clear temp*;
        
            
        
        end  
       
       
   end
   %to determine whether the p-values in the regression meet the threshold
   %specified by the permutations
   for node=1:100
   tempp=(perbage(:,node)>bpartial(i,node));
   bage_permutation(i,node)=sum(tempp)/5000; %align w/ number of permutations
   clear tempp;
   
   end
    
end


%ANALYSIS INCORPORATING HLE VARIABLES
%specify the desired covariates; link to source file (e.g., AF) and specify
%the column they are located in
cov=AF(:,1);
cov(:,2:3)=AF(:,8:9); %for HLE variables

%Multiple regression analysis
for i=1:5 %specifies each psychometric variable
    for node=1:50 
        tempcov=cov; %specifies our covariate 
        tempcov(:,4)=AF(:,(node+9)); %specifies the nodes with the covariate; if not using any covariates then specify tempcov(:,1)
        tempcov=[ones(size(tempcov,1),1) tempcov]; %specifies the intercept for the full model
        
        tempb=regress(AF(:,(i+1)),tempcov); %command to run the regression 
        
        
        
        
        
        bpartial(i,node)=tempb(5,1); %this runs the regression extracting the beta value (predictors)
        
        clear temp*;
        
        
        
    end
    
    
    
    
    
end




%Permutation analysis
for  i=1:5
   performance= AF(:,(i+1));
   for permutation=1:1000 %specifies the number of permutations
      performanceshuffle(:,permutation)=shuffle(performance); 
      
        for node=1:50
            
           tempcov=cov;
           tempcov(:,4)=AF(:,(node+9)); 

            tempcov=[ones(size(tempcov,1),1) tempcov];
        
            tempb=regress(performanceshuffle(:,permutation),tempcov);
        
        
        
        
        
           perbage(permutation,node)=tempb(5,1); 
  
        
          clear temp*;
        
            
        
        end  
       
       
   end
   %to determine whether the p-values in the regression meet the threshold
   %specified by the permutations
   for node=1:50
   tempp=(perbage(:,node)>bpartial(i,node));
   bage_permutation(i,node)=sum(tempp)/1000; %align w/ number of permutations
   clear tempp;
   
   end
    
end



%ANALYSIS WITH NO COVARIATES; SIMPLE REGRESSION
%Multiple regression analysis
for i=1:5 %specifies each psychometric variable
    for node=1:50  
        tempcov(:,1)=AF(:,(node+8)); 
        tempcov=[ones(size(tempcov,1),1) tempcov]; %specifies the intercept for the full model
        
        tempb=regress(AF(:,(i+1)),tempcov); %command to run the regression
        
        
        
        
        
        bpartial(i,node)=tempb(2,1); %this runs the regression extracting the beta value (predictors)
        
        clear temp*;
        
        
        
    end
    
    
    
    
    
end




%Permutation analysis
for  i=1:5
   performance= AF(:,(i+1));
   for permutation=1:1000 %specifies the number of permutations
      performanceshuffle(:,permutation)=shuffle(performance); 
      
        for node=1:50
            
           tempcov(:,1)=AF(:,(node+8)); 

            tempcov=[ones(size(tempcov,1),1) tempcov];
        
            tempb=regress(performanceshuffle(:,permutation),tempcov);
        
        
        
        
        
           perbage(permutation,node)=tempb(2,1); 
  
        
          clear temp*;
        
            
        
        end  
       
       
   end
   %to determine whether the p-values in the regression meet the threshold
   %specified by the permutations
   for node=1:50
   tempp=(perbage(:,node)>bpartial(i,node));
   bage_permutation(i,node)=sum(tempp)/1000; %align w/ number of permutations
   clear tempp;
   
   end
    
end




%ANALYSIS INCORPORATING ONLY AMOUNT OF TIME SPENT READING
%specify the desired covariates; link to source file (e.g., AF) and specify
%the column they are located in
cov=ILF(:,1);
cov(:,2)=ILF(:,8); %for HLE variables

%Multiple regression analysis
for i=1:5 %specifies each psychometric variable
    for node=1:50 
        tempcov=cov; %specifies our covariate 
        tempcov(:,3)=CC(:,(node+8)); %specifies the nodes with the covariate; if not using any covariates then specify tempcov(:,1)
        tempcov=[ones(size(tempcov,1),1) tempcov]; %specifies the intercept for the full model
        
        tempb=regress(CC(:,(i+1)),tempcov); %command to run the regression 
        
        
        
        
        
        bpartial(i,node)=tempb(4,1); %this runs the regression extracting the beta value (predictors)
        
        clear temp*;
        
        
        
    end
    
    
    
    
    
end




%Permutation analysis
for  i=1:5
   performance= CC(:,(i+1));
   for permutation=1:1000 %specifies the number of permutations
      performanceshuffle(:,permutation)=shuffle(performance); 
      
        for node=1:50
            
           tempcov=cov;
           tempcov(:,3)=CC(:,(node+8)); 

            tempcov=[ones(size(tempcov,1),1) tempcov];
        
            tempb=regress(performanceshuffle(:,permutation),tempcov);
        
        
        
        
        
           perbage(permutation,node)=tempb(4,1); 
  
        
          clear temp*;
        
            
        
        end  
       
       
   end
   %to determine whether the p-values in the regression meet the threshold
   %specified by the permutations
   for node=1:50
   tempp=(perbage(:,node)>bpartial(i,node));
   bage_permutation(i,node)=sum(tempp)/1000; %align w/ number of permutations
   clear tempp;
   
   end
    
end


