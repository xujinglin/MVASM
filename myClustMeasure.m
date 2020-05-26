function [jm,purity] =myClustMeasure(calculatedClust, realClust,emptyRealMapping)
% Initialization
efficiency = 0; purity = 0; PE = 0; jm = 0;

if nargin <3 || emptyRealMapping ==0
    pNum=length(calculatedClust);
    % both vectors should be in length*1 format
    [x,y] = size(calculatedClust);
    if y>x
        calculatedClust = calculatedClust';
    end
    [x,y] = size(realClust);
    if y >x
        realClust=realClust';
    end
    if 2 ~= length (find(size(calculatedClust) == size (realClust)))
        errordlg('Dimensions of Calculated and real mapping are mismatch','Wrong dimensions','modal');  
        return
    end
    % S=the clutering result in pairs - S(i,j)=1 if data point i and j are asigned to the same cluster
    clustPairs =  establishPairsMatrix (calculatedClust);
    realClustPairs=establishPairsMatrix (realClust);
    n11Mat= clustPairs&realClustPairs;        %pairs that appear in both methods
    n11=length(find(n11Mat));                       % number of pairs that appear in both methods
    n10 = length(find(realClustPairs)) - n11; % number of pairs that appear in 'real' classification, but not in the algorithm
    n01 =length(find(clustPairs)) - n11;         % number of pairs that appear in algorithm, but not in the 'real' classification
    if (n10+n01+n11)>0
        jm=n11/(n10+n01+n11);
    end
    if (n10+n11)>0
        %efficiency=sum(sum(efficiencyMat))/(numOfRealClust*numOfCalcClust);
        efficiency = n11/(n10+n11);
    end
    if (n01+n11)>0
        %purity=sum(sum(purityMat))/(numOfRealClust*numOfCalcClust);
        purity = n11/(n01+n11);
    end
    
    PE=sqrt(efficiency^2+purity^2);%norm
end

function [pairsMatrix]= establishPairsMatrix (array)
len = length(array);
pairsMatrix = sparse(len,len);
for ind = 1:max(array)
    [indices]= find(array==ind);
    lenInd =   length(indices);
    if mod(ind,10) ==0
        disp('.');
    end
    for jnd = 1:lenInd-1
        pairsMatrix(indices(jnd),indices(jnd+1:lenInd))=1;
    end
end
