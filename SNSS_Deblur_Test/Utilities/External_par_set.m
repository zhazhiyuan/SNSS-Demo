function  [Exte, model]  =  External_par_set( nSig )

Exte.step = 4;       % the step of two neighbor patches


Exte.nSig      =   nSig/255;



 load './model/PG_GMM_6x6_win15_nlsp10_delta0.002_cls65.mat';



Exte.ps = ps;        % patch size
Exte.nlsp = nlsp;  % number of non-local patches
Exte.Win = win;   % size of window around the patch
% dictionary and regularization parameter
for i = 1:size(GMM_D,2)
    Exte.D(:,:,i) = reshape(single(GMM_D(:, i)), size(GMM_S,1), size(GMM_S,1));
end
Exte.S = single(GMM_S);
