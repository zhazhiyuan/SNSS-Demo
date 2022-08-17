    function [filename, Sigma, PSNR_Final,FSIM_Final,SSIM_Final,Time_s]     =  SNSS_Test (filename, Sigma, gamma,  lamada, mu1, mu2, c1, c2)

randn ('seed',0);



fn               =     [filename, '.tif'];

I                =     imread(fn);

[~, ~, kk]       =     size (I);

if kk==3
    
    I     = rgb2gray (I);
       
end


[Deno, Par, Opts]              =    SNSS_Set (Sigma, I, gamma,  lamada, mu1, mu2, c1, c2);

% Par   is Internal NSS prior

% Opts  is External NSS prior

Deno.nim          =    Deno.I + Deno.nSig* randn(size( Deno.I ));

disp(sprintf('PSNR of the noisy image = %f \n', csnr(Deno.nim, Deno.I, 0, 0) ));


time0         =   clock;

[Denoising , iter, dif]              =    SNSS_Denoising( Deno, Opts, Par);

 Time_s =(etime(clock,time0));

im  = Denoising{iter};


PSNR_Final       =   csnr (im, Deno.I,0,0);
FSIM_Final       =   FeatureSIM(im, Deno.I);
SSIM_Final       =   cal_ssim (im, Deno.I,0,0);



if Sigma==10

Final_denoisng= strcat(filename,'_SNSS','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./10_Result/',Final_denoisng));


elseif Sigma==20

Final_denoisng= strcat(filename,'_SNSS','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./20_Result/',Final_denoisng));

elseif Sigma==30
    
Final_denoisng= strcat(filename,'_SNSS','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./30_Result/',Final_denoisng));

elseif Sigma==40
    
Final_denoisng= strcat(filename,'_SNSS','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./40_Result/',Final_denoisng));

elseif Sigma==50
    
Final_denoisng= strcat(filename,'_SNSS','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./50_Result/',Final_denoisng));

elseif Sigma==75
    
Final_denoisng= strcat(filename,'_SNSS','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./75_Result/',Final_denoisng));

else
    
Final_denoisng= strcat(filename,'_SNSS','_sigma_',num2str(Sigma),'_PSNR_',num2str(PSNR_Final),'_FSIM_',num2str(FSIM_Final),'_SSIM_',num2str(SSIM_Final),'.png');

imwrite(uint8(im),strcat('./100_Result/',Final_denoisng));
end


end

