clear

swissMotorway = MasterData.GraphFactory.create();
st = swissMotorway.getSt();

shortestPath = swissMotorway.deijkstra('Basel', 'Thun');
minimumSpanningTree = swissMotorway.kruskal();

disp(shortestPath{1,1});
disp(shortestPath{2,1});

G = digraph(st(:,2), st(:,1), st(:,3));
plot(G, 'EdgeLabel', st(:,3));


