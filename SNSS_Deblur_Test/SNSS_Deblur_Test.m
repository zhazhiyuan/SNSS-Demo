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



for i = 1:14
    
    
ImageNum =i;

switch ImageNum
            case 1
                filename = 'Bear';
             case 2
                filename = 'Buddhist';
             case 3
                filename = 'Butterfly';
             case 4
                filename = 'Corn';
             case 5
                filename = 'Cowboy';
             case 6
                filename = 'Flowers';
             case 7
                filename = 'Girls';
             case 8
                filename = 'Haight';
             case 9
                filename = 'Lake';
              case 10
                filename = 'leaves';
                
             case 11
                filename = 'lena';
             case 12
                filename = 'Light';
             case 13
                filename = 'pepper';
             case 14
                filename = 'Starfish';
 

             
end



for j  =  1:2
    

filename    

randn ('seed',0);

deblur_rate     =    [1,2];



blurtype =  deblur_rate(j)

sigma   =sqrt(2)




 if  blurtype== 1
     
     
     
          blur_par   =   9 ;
          
     
     mu1  = 8; mu2 = 0.5; c1  = 1.3; c2 = 0.9;  Err_or  =  0.0001;
    
   [Ori, blurtype,PSNR_Final,FSIM_Final,SSIM_Final,jjjj, dif, Time_s]  =   SNSS_deblur_test(filename,blurtype,blur_par, sigma, mu1, mu2, c1, c2, Err_or);
   
 
 m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}={Ori, blurtype,blur_par, mu1, mu2, c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,jjjj, dif, Time_s};

 
 xlswrite('SNSS_Deblur_Uniform.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 

 
 
 elseif  blurtype== 2
     
     
     
     
     blur_par  = 1.6; 
     

         
     mu1  = 1.3; mu2 = 0.4; c1  = 0.2; c2 =2.1; Err_or  =  8.9E-05;
     
 [Ori, blurtype,PSNR_Final,FSIM_Final,SSIM_Final,jjjj, dif, Time_s]  =   SNSS_deblur_test(filename,blurtype,blur_par, sigma, mu1, mu2, c1, c2, Err_or); 
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}={Ori, blurtype,blur_par, mu1, mu2, c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,jjjj, dif, Time_s};
 
 xlswrite('SNSS_Deblur_Gaussian.xls', All_data_Results_20_1{m_20_1},'sheet1',s);
 


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






         