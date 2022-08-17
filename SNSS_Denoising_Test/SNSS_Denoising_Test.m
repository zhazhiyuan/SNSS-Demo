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
                filename = 'Barbara';
            case 2
                filename = 'boats';
            case 3
                filename = 'foreman';
            case 4
                filename = 'Leaves';    
            case 5
                filename = 'lena'; 
                
            case 6
                filename = 'Miss';
            case 7
                filename = 'Monarch';
            case 8
                filename = 'peppers';
            case 9
                filename = 'plants';    
            case 10
                filename = 'starfish'; 
                
            case 11
                filename = 'airplane';
            case 12
                filename = 'House';
            case 13
                filename = 'J.Bean';                   
     
end



for j  =  1:7

        filename
        
    
randn ('seed',0);

Sigma_Num        =       [10, 20, 30, 40, 50, 75, 100]; 



Sigma             =       Sigma_Num(j)


 if  Sigma== 10
     

         
          gamma  = 0.1;      lamada  =   0.5;   mu1  =  0.2; mu2  = 0.04;  c1 = 0.4; c2 = 1.1;

[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  SNSS_Test (filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2);
 
 m_10_1= m_10_1+1;
 
 s=strcat('A',num2str(m_10_1));
 
 All_data_Results_10_1{m_10_1}={filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('SNSS_Sigma_10_Final.xls', All_data_Results_10_1{m_10_1},'sheet1',s);
 
 

 
 elseif  Sigma==20

         
       gamma  = 0.2;      lamada  =   0.4;   mu1  =  0.8; mu2  = 0.04; c1 = 1.3; c2 = 1.1;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  SNSS_Test (filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2);
 
 m_20_1= m_20_1+1;
 
 s=strcat('A',num2str(m_20_1));
 
 All_data_Results_20_1{m_20_1}={filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('SNSS_Sigma_20_Final.xls', All_data_Results_20_1{m_20_1},'sheet1',s);
 
 
 
  elseif  Sigma==30
     

         
        gamma  = 0.1;      lamada  =   0.4;   mu1  =  0.2; mu2  = 0.02; c1 = 1.9; c2= 1.1;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  SNSS_Test (filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2);
 
 m_30_1= m_30_1+1;
 
 s=strcat('A',num2str(m_30_1));
 
 All_data_Results_30_1{m_30_1}={filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('SNSS_Sigma_30_Final.xls', All_data_Results_30_1{m_30_1},'sheet1',s);


   elseif  Sigma==40
     

         
     gamma  = 0.1;      lamada  =   0.3;   mu1  =  0.7; mu2  = 0.04; c1 = 1.5; c2 =1.1;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  SNSS_Test (filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2);
 
 m_40_1= m_40_1+1;
 
 s=strcat('A',num2str(m_40_1));
 
 All_data_Results_40_1{m_40_1}={filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('SNSS_Sigma_40_Final.xls', All_data_Results_40_1{m_40_1},'sheet1',s);
 



 elseif  Sigma==50
     
         
     gamma  = 0.1;      lamada  =   0.3;   mu1  =  0.7; mu2  = 0.02; c1 = 1.4; c2 = 1.2;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  SNSS_Test (filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2);
 
 m_50_1= m_50_1+1;
 
 s=strcat('A',num2str(m_50_1));
 
 All_data_Results_50_1{m_50_1}={filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('SNSS_Sigma_50_Final.xls', All_data_Results_50_1{m_50_1},'sheet1',s);
 
 
  
 
 elseif  Sigma==75

         
     gamma  = 0.1;      lamada  =   0.3;   mu1  =  0.5; mu2  = 0.01; c1 = 1.5; c2 = 1.1;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  SNSS_Test (filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2);
 
 m_75_1= m_75_1+1;
 
 s=strcat('A',num2str(m_75_1));
 
 All_data_Results_75_1{m_75_1}={filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('SNSS_Sigma_75_Final.xls', All_data_Results_75_1{m_75_1},'sheet1',s);
 


 else
     

         
     gamma  = 0.1;      lamada  =   0.2;   mu1  =  1; mu2  = 0.03; c1 = 1.5; c2 =1;
     
[filename, Sigma,  PSNR_Final,FSIM_Final,SSIM_Final, Time_s]     =  SNSS_Test (filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2);
 
 m_100_1= m_100_1+1;
 
 s=strcat('A',num2str(m_100_1));
 
 All_data_Results_100_1{m_100_1}={filename, Sigma, gamma,  lamada, mu1, mu2,  c1, c2, PSNR_Final,FSIM_Final,SSIM_Final,Time_s};
 
 xlswrite('SNSS_Sigma_100_Final.xls', All_data_Results_100_1{m_100_1},'sheet1',s);



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






         