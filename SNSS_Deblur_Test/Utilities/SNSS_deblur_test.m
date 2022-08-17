
function [filename, blurtype,PSNR_Final,FSIM_Final,SSIM_Final, iter, difff, Time_s]= SNSS_deblur_test (filename,blurtype,blur_par, sigma, mu1, mu2, c1, c2, Err_or)

     time0                           =                       clock;

     Orgname                         =                       [filename '.tif'];
        
     X_RGB                           =                       imread(Orgname); 
        
     X_YUV                           =                       rgb2ycbcr(X_RGB);
        
     x                               =                       double(X_YUV(:,:,1)); 
        
     X_Deblur_Re                     =                       zeros(size(X_YUV));
        
     X_Deblur_Re(:,:,2)              =                        X_YUV(:,:,2); 
        
     X_Deblur_Re(:,:,3)              =                        X_YUV(:,:,3); 
     
     
     
    [Deno, Par, Opts]              =    SNSS_Set_Deblur (blurtype, sigma, mu1, mu2, c1, c2); 
    % Par is inter parameter
    % Opts is External Parameter
    
     Deno.I                        =     double(x);
     
     
     [Deno.bim, Deno.fft_h]        =     Generate_blur_image(Deno.I, blurtype, blur_par, sigma);
     
     
      fprintf( 'Blur image : PSNR = %f\n',  csnr(Deno.bim, Deno.I, 0,0));      
      
      
 
     
     [Denoising , iter, difff]            =    SNSS_Deblur_Main( Deno, Opts, Par, Err_or);
     
     
     im       =  Denoising{iter-1};
     
     
     Time_s                        =     (etime(clock,time0)); 
     
     X_Deblur_Re(:,:,1)            =      uint8(im);
     
     deblur_res                    =      ycbcr2rgb(uint8(X_Deblur_Re));   
  
    PSNR_Final                     =    csnr (im, Deno.I,0,0);
    
    FSIM_Final                     =    FeatureSIM(im, Deno.I);
    
     SSIM_Final                    =    cal_ssim (im, Deno.I,0,0);



if blurtype   == 1

Final_Deblur= strcat(filename,'_SNSS','_Uniform_','sigma_',num2str(sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(deblur_res),strcat('./Uniform_Result/',Final_Deblur));


elseif blurtype   == 2

Final_Deblur= strcat(filename,'_SNSS','_Gaussian_','sigma_',num2str(sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(deblur_res),strcat('./Gaussian_Result/',Final_Deblur));


else
    
Final_Deblur= strcat(filename,'_SNSS','_Others_','sigma_',num2str(sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(deblur_res),strcat('./Gaussian_Result/',Final_Deblur));


end


end
