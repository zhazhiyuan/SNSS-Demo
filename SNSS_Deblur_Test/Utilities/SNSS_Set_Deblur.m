
function  [Deno, Par, Opts]   =    SNSS_Set_Deblur( blurtype, nSig, mu1, mu2, c1, c2)

randn ('seed',0);


Deno.nSig      =   nSig;

Deno.K      =   520;

Deno.step      =  6;         

Deno.patch     =  6;  

Deno.Sim       =  25;   


Deno.iters     = 1;



if blurtype  == 1 % Uniform 
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;  
    
    Deno.eps2      =   0.3; %0.2   
    
    
    
elseif blurtype  == 2 % Gaussian
   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;   

    Deno.eps2      =   0.2; %0.2   
    
    
    
else
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;   
    
    Deno.eps2      =   0.2; %0.2  
    
    
    
end


end

