clear

swissMotorway = MasterData.GraphFactory.create();
swissMotorway.plot();

shortestPath = swissMotorway.dijkstra('Winterthur', 'Bern');
minimumSpanningTree = swissMotorway.kruskal();