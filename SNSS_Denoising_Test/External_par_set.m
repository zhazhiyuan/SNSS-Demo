function  [Exte, model]  =  External_par_set( nSig )

Exte.step = 3;       % the step of two neighbor patches


Exte.nSig      =   nSig/255;

if nSig <= 10
 %   load './model/PG_GMM_6x6_win15_nlsp10_delta0.002_cls65.mat';
     load './model/PG_GMM_7x7_win15_nlsp10_delta0.002_cls33.mat';

elseif nSig<=20
%    load './model/PG_GMM_6x6_win15_nlsp10_delta0.002_cls65.mat';
    load './model/PG_GMM_7x7_win15_nlsp10_delta0.002_cls33.mat';

elseif nSig <=30
    load './model/PG_GMM_7x7_win15_nlsp10_delta0.002_cls33.mat';

elseif nSig<=40
    load './model/PG_GMM_8x8_win15_nlsp10_delta0.002_cls33.mat';

elseif nSig<=50
    load './model/PG_GMM_8x8_win15_nlsp10_delta0.002_cls33.mat';

elseif nSig<=75
    load './model/PG_GMM_9x9_win15_nlsp10_delta0.002_cls33.mat';

else
    load './model/PG_GMM_9x9_win15_nlsp10_delta0.002_cls33.mat';

end
Exte.ps = ps;        % patch size
Exte.nlsp = nlsp;  % number of non-local patches
Exte.Win = win;   % size of window around the patch
% dictionary and regularization parameter
for i = 1:size(GMM_D,2)
    Exte.D(:,:,i) = reshape(single(GMM_D(:, i)), size(GMM_S,1), size(GMM_S,1));
end
Exte.S = single(GMM_S);
