
function  [Denoising , iter, dif]     =     SNSS_Denoising( Deno, Opts, Par )

% Par   is Internal NSS prior

% Opts  is External NSS prior

randn ('seed',0);

Nim            =   Deno.nim;

[h, w, ~]     =   size(Nim);

Out_Put        =   Nim;

v           =   Deno.nSig;

   

cnt            =   1;

Denoising      =  cell (1,Deno.Iter);

IM             =  eye (size(Nim));

All_PSNR       =  zeros (1,Deno.Iter);




for iter = 1 : Deno.Iter    
    
    
        Out_Put               =    Out_Put + Deno.gamma*(Nim - Out_Put);
        
         dif                  =    Out_Put-Nim;
        
         vd                   =    v^2-(mean(mean(dif.^2)));  
        
    if iter==1
                          
            Deno.nSig         =    sqrt(abs(vd)); 
    else
        
            Deno.nSig         =    sqrt(abs(vd)) * Deno.lamada;          
    end 
   
    %%
      % Internal NSS prior by used Group Sparsity
      Inter_Out      =     Inter_NSS_Main  (Out_Put, Par, Deno.nSig, Deno.patch, Deno.Sim, Deno.step );  
      
      %External NSS prior by used PGPD method
      Exter_Out      =     Exter_NSS_Main  (Out_Put, Opts, Deno.nSig);       
     
    %%

  
   %   Out_Put            =       (Nim + Par.mu2*Deno.nSig^2*Inter_Out + Opts. mu1 * Deno.nSig^2* Exter_Out)/(IM + Par.mu2 * Deno.nSig^2 + Opts. mu1*Deno.nSig^2);
      
      
      Out_Put            =       (Par.mu2*Opts. mu1*Deno.nSig^2 * Nim  + Opts. mu1*v^2* Inter_Out + Par.mu2*v^2 *Exter_Out)/...
                                 (Par.mu2*Opts. mu1*Deno.nSig^2 + Opts. mu1*v^2 + Par.mu2*v^2);
      

        
     Denoising{iter}    =        Out_Put;
     
     
     All_PSNR (iter)    =        csnr( Out_Put(1:h, 1:w), Deno.I, 0, 0 );

              
    fprintf( 'Iteration %d :  PSNR = %f\n', cnt,  csnr( Out_Put(1:h, 1:w), Deno.I, 0, 0 ));
    
    cnt   =  cnt + 1;
        
  
       if  iter > 1
      
            dif      =  norm(abs(Denoising{iter}) - abs(Denoising{iter-1}),'fro')/norm(abs(Denoising{iter-1}), 'fro');
       
         if dif<   Par. Err_or
           
               break;
         end
       
      end
  
   
end


end





