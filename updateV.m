%-------------------------------------------------------------------------------------------------------------------------------------
% Contributed by Jinglin Xu
% Ref:
% [1] Multi-View K-Means Clustering on Big Data. (IJCAI,2013).
% [2] Discriminatively Embedded K-Means for Multi-view Clustering. (CVPR,2016)
% [3] Robust and Sparse Fuzzy K-Means Clustering. (IJCAI2016)
%--------------------------------------------------------------------------------------------------------------------------------------

function V = updateV(X,Ut)

[m,~] = size(X);

Vup = X * Ut';          
Vdown = sum(Ut,2);     
V = Vup./repmat(Vdown',m,1); 

