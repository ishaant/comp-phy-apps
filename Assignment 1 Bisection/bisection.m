function [root, iter]=bisection(X_left, X_right, funct, Tol)
%Bisection Method


%Initialization
iteration=0;
error=10*Tol;
X_middle=(X_left+X_right)/2;

  if funct(X_left)==0
 
    root=X_left
  
  elseif funct(X_right)==0
      
    root=X_right
      
  elseif funct(X_middle)==0
  
      root=X_middle
      
  else
            while error>Tol
                
               f_left=funct(X_left);
               f_middle=funct(X_middle);
                    iteration=iteration+1;


                    if f_left*f_middle<0
                        X_right=X_middle;

                    elseif f_middle==0
                        X_left=X_middle;
                        X_right=X_middle;
                        
                    else
                        X_left=X_middle; 
                    end


                    X_middle=(X_left+X_right)/2;

                    error=X_right-X_left;

                 end

                    root=X_middle
                    
  end
  
  iter=iteration


end

