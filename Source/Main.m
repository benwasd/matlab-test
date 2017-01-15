clear

swissMotorway = MasterData.GraphFactory.create();
st = swissMotorway.getSt();

shortestPath = swissMotorway.deijkstra('Winterthur', 'Bern');
minimumSpanningTree = swissMotorway.kruskal();

disp(shortestPath{1,1});
disp(shortestPath{2,1});

G = digraph(st(:,1), st(:,2), st(:,3));
plot(G, 'EdgeLabel', G.Edges.Weight, 'NodeLabel',arrayfun(@(x) x.Name, swissMotorway.Nodes, 'UniformOutput', false));
