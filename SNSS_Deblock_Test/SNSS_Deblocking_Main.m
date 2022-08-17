function    [im, j, diff]                    =                          SNSS_Deblocking_Main(Im_out, Deno, Par, Opts, JPEG_Quality)

   randn ('seed',0);
ori_im                      =                        Deno.I; 

n_im                        =                        Im_out; 

[h1, w1]                    =                        size(ori_im); 


d_im                        =                        Im_out;  % 256 *256 初始化


v                           =                        Deno.nSig; %噪声水平  18.3017


cnt                         =                         1;


All_PSNR                    =                         zeros(1,Deno.Iter);

SNSS_Results             =                         cell (1,Deno.Iter);   





if JPEG_Quality<= 1
    

   vale = 0.00012;
     
elseif JPEG_Quality<= 5  
    
    
       vale = 6.78E-05;
    

elseif JPEG_Quality<= 10  
         
       vale = 4.55E-05;
   
     
elseif JPEG_Quality<= 20  
         
       vale = 2.72E-05;
    
elseif JPEG_Quality<= 30  
    
       vale = 1.89E-05;
  
else
    

       vale = 1.70E-05;
     
end




for j                        =                1 : Deno.Iter
    
       %if (j ==1)
     %   d_im                 =                         n_im;
        
     %   nSig1                =                           v;
    %   end
    
      
      
  %     d_im                  =                        SSR_ARC_Solver(d_im, Deno, p);
  
          d_im               =   d_im +    0.1 *(n_im - d_im);
  
  
          dif1                 =                         d_im-n_im;
        
    
          vd                   =                          v^2-(mean(mean(dif1.^2)));
        
        
       if j==1
            
            Deno.nSig             =         sqrt(abs(vd)); 
            
       else
            
             Deno.nSig            =         sqrt(abs(vd))* Deno.lamada  ;
            
       end 
        
  
       
       
       Inter_Out      =     Inter_NSS_Main  (d_im, Par, Deno.nSig, Deno.patch, Deno.Sim, Deno.step );  
      
      %External NSS prior by used PGPD method
       Exter_Out      =     Exter_NSS_Main  (d_im, Opts, Deno.nSig);       
     
    %%
     
       
        
    
   %     d_im                 =                          (d_im*v^2*2*10+ n_im*nSig1^2)/(v^2*2*10 + nSig1^2);
        
  %      d_im                 =                          (d_im*v^2*2*Deno.AA+ n_im*nSig1^2)/(v^2*2*Deno.AA + nSig1^2);
  
        d_im                 =       (Par.mu2*Opts. mu1*Deno.nSig^2 * n_im  + Opts. mu1*v^2* Inter_Out + Par.mu2*v^2 *Exter_Out)/...
                                 (Par.mu2*Opts. mu1*Deno.nSig^2 + Opts. mu1*v^2 + Par.mu2*v^2);      
       
    
        d_im                 =                           BDCT_project_onto_QCS(d_im, Deno.C_q, Deno.QTable, Deno.Qfactor, Deno.blockSize);
    
        
        All_PSNR(j)        =                            csnr( d_im(1:h1,1:w1), ori_im, 0, 0 );
    
      fprintf( 'SNSS Debloking:  Preprocessing, Iter %d : PSNR = %2.2f\n', cnt,  csnr( d_im(1:h1,1:w1), ori_im, 0, 0 ));
    
         cnt   =  cnt + 1;       
         
           SNSS_Results{j}      =                      d_im;
         
         if j>1
             
            diff      =  norm(abs(SNSS_Results{j}) - abs(SNSS_Results{j-1}),'fro')/norm(abs(SNSS_Results{j-1}), 'fro');    
             
             if    diff<=vale
                 
                 break;
             end
             
         end
       
      
    
    
end


   %     im               =                 d_im;
        
        im               =                     SNSS_Results{j-1};                                      

end

