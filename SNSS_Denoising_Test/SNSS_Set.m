
function  [Deno, Par, Opts]   =    SNSS_Set( nSig,  I, gamma,  lamada, mu1, mu2, c1, c2)

randn ('seed',0);

Deno.I         =   double(I);

Deno.nSig      =   nSig;

Deno.Iter      =   100;


if   nSig <= 30
    
    Deno.step     =  3;   
    
else
   Deno.step     =  4;         
end



if nSig <= 10
    
    Deno.gamma     =  gamma;     
    
    Deno.lamada    =  lamada;   
    
    Deno.patch     =  7;   
    
    Deno.Sim       =  60;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;    
    
    Par. Err_or    = 4.6E-05;
    
elseif nSig <= 20
    
    Deno.gamma     =  gamma;     
    
    Deno.lamada    =  lamada;  
    
    Deno.patch     =  7;    
    
    Deno.Sim       =  60;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;   
     
    Par. Err_or    = 3.4E-05;
    
elseif nSig <= 30
    
    Deno.gamma     =  gamma;     
    
    Deno.lamada    =  lamada;   
    
    Deno.patch     =  7;   
    
    Deno.Sim       =  60;   
     
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;   
    
    Par. Err_or    = 6.1E-05;    
    
 elseif nSig <= 40
    
    Deno.gamma     =  gamma;     
    
    Deno.lamada    =  lamada;   
    
    Deno.patch     =  8;   
    
    Deno.Sim       =  70;   
    
    Opts. mu1      =  mu1;     %  External
    
    Opts. c1       =   c1;     %  External
       
    Par. mu2       =  mu2;     %  Internal 
    
    Par. c2        =   c2;     %  Internal
    
    Par. Err_or    = 6.6E-05; 

elseif nSig<=50
    
    Deno.gamma     =  gamma;     
    
    Deno.lamada    =  lamada;   
    
    Deno.patch     =  8;   
    
    Deno.Sim       =  80; 
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;   
    
    Par. Err_or    = 7.9E-05; 
    
elseif nSig<=75
    
    Deno.gamma     =  gamma;     
    
    Deno.lamada    =  lamada;  
    
    Deno.patch     =  9;   
    
    Deno.Sim       =  90;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;   
    
    Par. Err_or    = 9.4E-05;
    
else
    
    Deno.gamma     =  gamma;     
    
    Deno.lamada    =  lamada;   
    
    Deno.patch     =  9;   
    
    Deno.Sim       =  100;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;   
    
    Par. Err_or    = 0.0001;
end


end

