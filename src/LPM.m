function [ Lm, memo ] = LPM( memo, m )
% Calculate L^(m) and update to memo cell
% memo  [cell]  stores the calculated Ls
% m     [int]   order

Lm = memo{m};

if ~isempty(Lm)
    % return result in memo directly
    return
end

[Lm1, memo] = LPM(memo, floor(m/2));
[Lm2, memo] = LPM(memo, ceil(m/2));

d = size(Lm1,1);
Lm = zeros(d);
for i = 1:d
    for j = 1:d
        Lm(i,j) = max(Lm1(i,:) + Lm2(:,j).');
    end
end

% update to the memo cell
memo{m} = Lm;

end

