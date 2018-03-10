function [ path_length, dp_path_map ] = findLongestPath( src, dest, dp_path_map, adjacent, node_times )
% Find the longest path from node src to node dest
% Using dynamic programming, which is NOT the best algorithm,
% but it's best for programmers.
% 
% src   [int]   source node
% dest  [int]   destination node
% dp_path_map   [2-d matrix]    stores calculated path
% adjacent      [2-d matrix]    adjacent matrix of the graph
% node_times    [vector]        computing time of each node   

path_length = dp_path_map(src,dest);

if path_length ~= 0
    % return calculated value
    return
end

s_adjs = find(adjacent(src,:)==1);
if isempty(s_adjs)
    % source node has no adjacent nodes
    path_length = -inf;
    dp_path_map(src,:) = -inf;
    return
end

path_length = -inf;
for v = s_adjs
    [sub_length, dp_path_map] = findLongestPath(v,dest,dp_path_map,adjacent,node_times);
    path_length = max(path_length, node_times(src) + sub_length);
end
dp_path_map(src,dest) = path_length;

end

