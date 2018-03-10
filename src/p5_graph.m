% convert graph of problem 5 into a matrix
%% Define the graph
Nlogic = 34;    % 34 logic nodes
times = ones(1,34);     % computing time of each logic node
times([5,10,14,21,22,27,31,34]) = 2;    % multiply nodes

A = zeros(Nlogic);  % adjacent matrix
edges = sub2ind(size(A),...
    [1,2,2,2,3,5,6,6,6,7,7,7,8,9,10,11,11,12,14,15,15,15,16,17,17,17,18,18,18,20,21,22,23,24,24,24,25,25,25,26,27,28,28,29,31,32,34],...
    [4,3,6,7,5,1,3,4,9,8,15,16,10,11,6,13,14,13,12,8,9,20,17,20,21,22,19,23,26,19,15,18,27,17,18,23,26,32,33,28,25,30,31,30,29,34,33]);
A(edges) = 1;

%% Find longest path for any given two nodes
% preprocess dp_path_map
dp_path_map = diag(times);      % 0 is the flag of NOT-CALCULATED,
                                % path from node to itself is its computing
                                % time

%% Calculate L1 matrix for problem 5
d = 7;
L1 = -inf*ones(d);

start_nodes_cell = {[2],[11,12],[7],[16],[28,29],[24],[24,25,32]};
end_nodes_cell = {[4],[12],[13],[19],[29],[30],[33]};

for i = 1:d
    for j = 1:d
        for start_node = start_nodes_cell{i}
            for end_node = end_nodes_cell{j}
               [path_length, dp_path_map] = findLongestPath(start_node, end_node,...
                   dp_path_map, A, times);
               L1(i,j) = max(L1(i,j), path_length);
            end
        end
    end
end

