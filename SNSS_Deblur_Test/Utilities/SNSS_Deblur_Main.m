function [Denoising , k, difff]            =    SNSS_Deblur_Main( Deno, Opts, Par, Err_or)


    b_im                               =                 Deno.bim;
    
    d_im                               =                  b_im; 
    
    [h1, w1]                           =                  size(Deno.I);
    
    fft_h                              =                  Deno.fft_h;

    Y_f                                =                  fft2(b_im); 
    
    A_f                                =                  conj(fft_h).*Y_f; 
    
    H2_f                               =                  abs(fft_h).^2;
    

    
    
    Denoising                          =                 cell (1, Deno.K *Deno.iters );
    
    
    All_PSNR                           =                  zeros (1, Deno.K *Deno.iters );
    
    
    for   k           =             1:  Deno.K
        
        
        
         
           f                           =                     d_im;  
                         
           f_pre                       =                     f; 
   
           %     if (mod(cnt, 3) == 0)
           %            if isfield(Deno,'I')
           %            PSNR     =  csnr( f(1:h1,1:w1), Deno.I, 0, 0 );
           %              fprintf( 'GSR_SNSS deblurring: iter. %d : PSNR = %f\n', cnt, PSNR);
           %            end
           %     end      
                
        for  i  =  1 : 4
            
            im_f     =   fft2((f_pre));
            
            Z_f      =   im_f + (A_f - H2_f.*im_f)./(H2_f + Deno.eps2);
            
            z        =   real(ifft2((Z_f)));
            
            f_pre    =   max(min(z,255),0);       
            
        end          
        
           f                         =                      SNSS_Denoising( f_pre, Deno, Opts, Par );      
                
           d_im                      =                      f;
          
           All_PSNR (k)              =                      csnr(d_im, Deno.I, 0,0);
           
           Denoising{k}              =                      d_im;
           
     fprintf( 'SNSS deblurring: iter. %d : PSNR = %f\n', k, csnr(f, Deno.I, 0,0));       
    
          if  k > 1
      
            difff      =  norm(abs(Denoising{k}) - abs(Denoising{k-1}),'fro')/norm(abs(Denoising{k-1}), 'fro');
       
         if difff < Err_or
           
               break;
         end
       
         end  

        
    end
    


end

