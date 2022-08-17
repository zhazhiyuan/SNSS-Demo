clc
clear
m_10_1=0; 
m_10_2=0; 
m_10_3=0; 
m_20_1=0; 
m_20_2=0; 
m_20_3=0; 
m_30_1=0; 
m_30_2=0; 
m_30_3=0; 
m_40_1=0;
m_40_2=0; 
m_40_3=0; 
m_50_1=0;
m_50_2=0; 
m_50_3=0; 
m_75_1=0;
m_75_2=0; 
m_75_3=0; 
m_100_1=0;
m_100_2=0; 
m_100_3=0; 

All_data_Results_10_1 = cell(1,200);
All_data_Results_10_2 = cell(1,200);
All_data_Results_10_3 = cell(1,200);

All_data_Results_20_1 = cell(1,200);
All_data_Results_20_2 = cell(1,200);
All_data_Results_20_3 = cell(1,200);

All_data_Results_30_1 = cell(1,200);
All_data_Results_30_2 = cell(1,200);
All_data_Results_30_3 = cell(1,200);

All_data_Results_40_1 = cell(1,200);
All_data_Results_40_2 = cell(1,200);
All_data_Results_40_3 = cell(1,200);

All_data_Results_50_1 = cell(1,200);
All_data_Results_50_2 = cell(1,200);
All_data_Results_50_3 = cell(1,200);

All_data_Results_75_1 = cell(1,200);
All_data_Results_75_2 = cell(1,200);
All_data_Results_75_3 = cell(1,200);

All_data_Results_100_1 = cell(1,200);
All_data_Results_100_2 = cell(1,200);
All_data_Results_100_3 = cell(1,200);



for i = 1:13
ImageNum =i;

switch ImageNum
         case 1
                filename = 'Bahoon';
            case 2
                filename = 'Barbara';
            case 3
                filename = 'boats';
            case 4
                filename = 'couple';    
            case 5
                filename = 'elaine'; 
                
            case 6
                filename = 'fingerprint';
            case 7
                filename = 'Goldhill';
            case 8
                filename = 'Lake';
            case 9
                filename = 'lena';    
            case 10
                filename = 'pentagon'; 
                
            case 11
                filename = 'plants';
            case 12
                filename = 'starfish';
            case 13
                filename = 'straw';     
                
   
            
end
for j  =  1:11
    

        filename
    
randn ('seed',0);

JPEG_Quality_Num            = [ 1, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90];



JPEG_Quality            =      JPEG_Quality_Num (j)






if JPEG_Quality<= 1
    

     lambda  = 0.4;      mu1  =   0.5;     mu2  =   0.01;  c1  =  0.6;   c2  =   1.1; QF =      0.25;
     
elseif JPEG_Quality<= 5  
    

     lambda  = 0.4;      mu1  =   1;     mu2  =   0.03;  c1  =  1.8;   c2  =   0.8; QF =      0.20;

elseif JPEG_Quality<= 10  
         

     lambda  = 0.7;      mu1  =   0.8;     mu2  =   0.01;  c1  =  0.9;   c2  =  0.7; QF =      0.25;
     
elseif JPEG_Quality<= 20  
         

     lambda  = 0.8;      mu1  =   0.6;     mu2  =   0.01;  c1  =  1.9;   c2  =   1; QF =      0.25;
     
elseif JPEG_Quality<= 30  
    

     lambda  = 1;      mu1  =   0.2;     mu2  =   0.01;  c1  =  0.8;   c2  =   1; QF =      0.25;

else
    

     lambda  = 1;      mu1  =   1;     mu2  =   0.02;  c1  =  1.2;   c2  =   1.2; QF =      0.25;
     
end








 if  JPEG_Quality== 1
     

     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
  m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_1.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 
 

 
 elseif  JPEG_Quality==5
     

  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_5.xls', All_data_Results_20_1{m_20_1},'sheet1',s);
 
 
 
  elseif  JPEG_Quality==10

     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_30_1= m_30_1+1;
 
 s=strcat('A',num2str(m_30_1));
 
 All_data_Results_30_1{m_30_1}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_10.xls', All_data_Results_30_1{m_30_1},'sheet1',s);

   elseif  JPEG_Quality==20
     
   
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_40_1= m_40_1+1;
 
 s=strcat('A',num2str(m_40_1));
 
 All_data_Results_40_1{m_40_1}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_20.xls', All_data_Results_40_1{m_40_1},'sheet1',s);
 
 
   
 elseif  JPEG_Quality==30
     

     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_50_1= m_50_1+1;
 
 s=strcat('A',num2str(m_50_1));
 
 All_data_Results_50_1{m_50_1}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_30.xls', All_data_Results_50_1{m_50_1},'sheet1',s);
 
 
 
 
 
 elseif  JPEG_Quality==40
     
     
     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_75_1= m_75_1+1;
 
 s=strcat('A',num2str(m_75_1));
 
 All_data_Results_75_1{m_75_1}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_40.xls', All_data_Results_75_1{m_75_1},'sheet1',s);
 
 
 elseif JPEG_Quality==50
         
     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_75_2= m_75_2+1;
 
 s=strcat('A',num2str(m_75_2));
 
 All_data_Results_75_2{m_75_2}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_50.xls', All_data_Results_75_2{m_75_2},'sheet1',s);         
          
 elseif JPEG_Quality==60
     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_75_3= m_75_3+1;
 
 s=strcat('A',num2str(m_75_3));
 
 All_data_Results_75_3{m_75_3}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_60.xls', All_data_Results_75_3{m_75_3},'sheet1',s);        
 
 
         
 elseif JPEG_Quality==70

     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_100_1= m_100_1+1;
 
 s=strcat('A',num2str(m_100_1));
 
 All_data_Results_100_1{m_100_1}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_70.xls', All_data_Results_100_1{m_100_1},'sheet1',s);
 
 
 
 
 elseif JPEG_Quality==80

     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_100_2= m_100_2+1;
 
 s=strcat('A',num2str(m_100_2));
 
 All_data_Results_100_2{m_100_2}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_80.xls', All_data_Results_100_2{m_100_2},'sheet1',s);         
 
 
 
          
     else

     
  [filename, JPEG_Quality,   lambda, mu1, mu2,  JPEG_PSNR, PSNR_Final,FSIM_Final,SSIM_Final, iter, diff, Time_s]     =  SNSS_Deblock_Test (filename, JPEG_Quality,  lambda, mu1, mu2, c1, c2, QF);
 
 m_100_3= m_100_3+1;
 
 s=strcat('A',num2str(m_100_3));
 
 All_data_Results_100_3{m_100_3}= {filename, JPEG_Quality, lambda, mu1, mu2, c1, c2, PSNR_Final, FSIM_Final,SSIM_Final, iter, diff, Time_s};
 
 xlswrite('SNSS_JPEG_Quality_90.xls', All_data_Results_100_3{m_100_3},'sheet1',s);                
         


 end
 

clearvars -except filename i m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end


clearvars -except filename m_10_1 m_10_2 m_10_3 m_20_1 m_20_2 m_20_3 m_30_1 m_30_2 m_30_3 m_40_1 m_40_2 m_40_3...
m_50_1 m_50_2 m_50_3 m_75_1 m_75_2 m_75_3 m_100_1 m_100_2 m_100_3 All_data_Results_10_1...
All_data_Results_10_2 All_data_Results_10_3 All_data_Results_20_1 All_data_Results_20_2...
All_data_Results_20_3 All_data_Results_30_1 All_data_Results_30_2 All_data_Results_30_3...
All_data_Results_40_1 All_data_Results_40_2 All_data_Results_40_3 All_data_Results_50_1...
All_data_Results_50_2 All_data_Results_50_3 All_data_Results_75_1 All_data_Results_75_2...
All_data_Results_75_3 All_data_Results_100_1 All_data_Results_100_2 All_data_Results_100_3
end






         