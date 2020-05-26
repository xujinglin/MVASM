%--------------------------------------------------------------------------------------------------------------------------------------
% Contributed by Jinglin Xu
% Ref: 
% [2] Discriminatively Embedded K-Means for Multi-view Clustering. (CVPR,2016)
% [3] Robust and Sparse Fuzzy K-Means Clustering. (IJCAI2016)
%--------------------------------------------------------------------------------------------------------------------------------------

function G = make_G_max(label_in)
% transform label to G: n*c
c = max(label_in);
n = length(label_in);
index = cell(c,1);
G = zeros(n,c);
for k =1:c
    index{k} = find(label_in == k);
    for j = 1:length(index{k})
        G(index{k}(j), k) = 1;
    end
end
