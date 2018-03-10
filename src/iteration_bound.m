% Iteration bound for #3
clear all;

%% Define the input
%%%%%%%%%%%%%%%%%%%%% problem 1 %%%%%%%%%%%%%%%%%%
d = 3;  % 3 delay nodes
L1 = [-inf, 0, -inf;
    7, -inf, 3;
    3, -inf, -inf];
%%%%%%%%%%%%%%%%%%%%% problem 3 %%%%%%%%%%%%%%%%%%
d = 6;
L1 = [4, 4, 4, -inf, 4, -inf;
    -inf, -inf, -inf, -inf, -inf, -inf;
    -inf, -inf, -inf, 0, -inf, -inf;
    4, 4, 4, -inf, 4, -inf;
    -inf, -inf, -inf, -inf, -inf, 0;
    -inf, -inf, -inf, -inf, -inf, -inf];
%%%%%%%%%%%%%%%%%%%%% problem 5 %%%%%%%%%%%%%%%%%%
p5_graph;   % run script to get L1 for problem 5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
memo{1,d} = [];     % define memo cell
memo{1} = L1;

%% Calculate all Ls
for k = 1:d
    [~,memo] = LPM(memo,k);
end

%% Get iteration bound
bound = getIterationBound(memo);

display(bound);