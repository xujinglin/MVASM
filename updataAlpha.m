function Alpha = updataAlpha(X,U,V,q,numview)

for p = 1:numview
    D{p} = pdist2(X{p}',V{p}');
    A(p) = trace(D{p}*U);
    alpha_up(p) = A(p)^(1/(1-q));
end

alpha_down = sum(alpha_up);
Alpha = alpha_up./alpha_down;


