%--------------------------------------------------------------------------------------------------------------------------------------
% Contributed by Jinglin Xu
% Ref: 
% [2] Discriminatively Embedded K-Means for Multi-view Clustering. (CVPR,2016)
% [3] Robust and Sparse Fuzzy K-Means Clustering. (IJCAI2016)
% [5] https://github.com/ZJULearning/MatlabFunc/tree/master/Clustering
%--------------------------------------------------------------------------------------------------------------------------------------

function [U0,V0,label] = initialU(X,c,numview)

% ------ kmeans initialization --------%
for p = 1:numview
    [label,k_center] = litekmeans(X{p}',c);   
    V0{p} = k_center';   
    Label{p} = label;
end
U0 = make_G_max(Label{2});
U0 = U0';   




