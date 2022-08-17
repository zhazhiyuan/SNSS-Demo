
function  [Deno, Par, Opts]   =    SNSS_Deblock_Set(   I, JPEG_Quality, lamada, mu1, mu2, c1, c2)

randn ('seed',0);

Deno.I         =   double(I);

Deno.Iter      =   100;

Deno.step      =   4;         

Deno.patch     =  7;   

Deno.Sim       =  60;  


if JPEG_Quality <= 1
      
    Deno.lamada    =  lamada;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;    
    
elseif JPEG_Quality <= 5
    
    Deno.lamada    =  lamada;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;    
     
    
elseif JPEG_Quality <= 10
    
    Deno.lamada    =  lamada;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;     
    
    
 elseif JPEG_Quality <= 20
    
    Deno.lamada    =  lamada;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;    
    
elseif JPEG_Quality <= 30
    
    Deno.lamada    =  lamada;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;    

elseif JPEG_Quality <= 40
    
     Deno.lamada    =  lamada;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;     
    
else
    
    Deno.lamada    =  lamada;   
    
    Opts. mu1      =  mu1;    
    
    Opts. c1       =   c1;   
       
    Par. mu2       =  mu2;
    
    Par. c2        =   c2;    
end


end

