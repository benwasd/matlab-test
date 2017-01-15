clear

swissMotorway = MasterData.GraphFactory.create();
swissMotorway.plot();

shortestPath = swissMotorway.deijkstra('Winterthur', 'Bern');
minimumSpanningTree = swissMotorway.kruskal();

peter = Model.Mensch();
kuchen = peter.definiereEssen('Kuchen');
pizza = peter.definiereEssen('Pizza');
kuchen(); % Peter isst Kuchen, er hat schon 1 gehabt.
pizza();  % Peter isst Pizza, er hat schon 1 gehabt.
kuchen(); % Peter isst Kuchen, er hat schon 2 gehabt.
kuchen(); % Peter isst Kuchen, er hat schon 3 gehabt.
pizza();  % Peter isst Pizza, er hat schon 2 gehabt.