
function  [Out_Put]     =     SNSS_Denoising( f_pre, Deno, Opts, Par )

% Par   is Internal NSS prior

% Opts  is External NSS prior

randn ('seed',0);

Nim            =   f_pre;


Out_Put        =   Nim;

v           =   Deno.nSig;

  

% time0                           =                       clock;

for iter = 1 : 6
    

    %%
      % Internal NSS prior by used Group Sparsity
      Inter_Out      =     Inter_NSS_Main  (Out_Put, Par, Deno.nSig, Deno.patch, Deno.Sim, Deno.step );  
      
      %External NSS prior by used PGPD method
      Exter_Out      =     Exter_NSS_Main  (Out_Put, Opts, Deno.nSig);       
     

      Out_Put            =       (Par.mu2*Opts. mu1*Deno.nSig^2 * Nim  + Opts. mu1*v^2* Inter_Out + Par.mu2*v^2 *Exter_Out)/...
                                 (Par.mu2*Opts. mu1*Deno.nSig^2 + Opts. mu1*v^2 + Par.mu2*v^2);
        
   
end

 %Time_a                        =     (etime(clock,time0))


end





