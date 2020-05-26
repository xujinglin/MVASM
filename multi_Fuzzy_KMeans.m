%-------------------------------------------------------------------------------------------------------------------------------------
% Contributed by Jinglin Xu
% Ref:
% [1] Multi-View K-Means Clustering on Big Data. (IJCAI,2013).
% [2] Discriminatively Embedded K-Means for Multi-view Clustering. (CVPR,2016)
% [3] Robust and Sparse Fuzzy K-Means Clustering. (IJCAI2016)
% [4] A new simplex sparse learning model to measure data similarity for clustering (AAAI2015)
%--------------------------------------------------------------------------------------------------------------------------------------

function [outU,outV,outAlpha,outObj,outNumIter] = multi_Fuzzy_KMeans(X,U,V,Alpha,gamma,q,numview,maxIter)
[~,n] = size(U);
thresh = 10^-7;
obj = zeros(maxIter,1);
% -----------------
for t = 1:maxIter
    
    %-------- update U when fixed V and Alpha--------%
    [U,D] = updateU(X,V,Alpha,q,gamma,numview);  
    
    %-------- update V when fixed U and Alpha--------%
    for p = 1:numview
        V{p} = updateV(X{p},U);    
    end
    
    %-------- update Alpha when fixed U and V--------%
    Alpha = updataAlpha(X,U,V,q,numview);    
    
    %------- calculate the obj --------%
    for p = 1:numview
        D{p} = pdist2(X{p}',V{p}');  
        for i = 1:n
            obj(t) = obj(t) + (Alpha(p)^q).*D{p}(i,:)*U(:,i) + U(:,i)'*U(:,i)*gamma;   
        end
    end
    
    %-------- convergence condition ---------%
    if(t > 1)
        diff = obj(t-1)-obj(t);
        if(diff < thresh)
            break;
        end
    end
end
outObj = obj;
outNumIter = t;
outU = U;
outV = V;
outAlpha = Alpha;