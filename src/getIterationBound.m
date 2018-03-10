function [ iteration_bound ] = getIterationBound( memo )
% Calculate iteration bound from a list of Ls

d = length(memo);
bounds = zeros(d);

for k = 1:d
    L = memo{k};
    bounds(:,k) = diag(L)/k;
end

iteration_bound = max(max(bounds));

end

