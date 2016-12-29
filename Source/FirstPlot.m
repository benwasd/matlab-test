clear

bern = Model.Node('Bern', 1);
scho = Model.Node('Schönbühl', 2);
biel = Model.Node('Biel', 3);
lute = Model.Node('Luterbach', 4);
zuer = Model.Node('zürich', 5);

bern.connect(Model.Lane(100, 6.1, 0), scho);
scho.connect(Model.Lane(100, 6.1, 10), bern);
scho.connect([Model.Lane(100, 1.5, 0), Model.Lane(120, 23.8, 0)], biel);
biel.connect([Model.Lane(120, 23.8, 0), Model.Lane(100, 1.5, 0)], scho);
biel.connect(Model.Lane(80, 17.3, 0), lute);
lute.connect(Model.Lane(80, 17.3, 0), biel);
scho.connect(Model.Lane(120, 24.5, 0), lute);
lute.connect(Model.Lane(120, 24.5, 0), scho);

st = [];
st = x(st, bern);
st = x(st, scho);
st = x(st, biel);
st = x(st, lute);

G = digraph(st(:,1), st(:,2), st(:,3));
plot(G, 'EdgeLabel', st(:,3));

function st = x(st, source)
    connectedNodes = source.connectedNodes();
    for i = 1:size(connectedNodes,1)
        weight = connectedNodes{i,1};
        node = connectedNodes{i,2};
        st = vertcat(st, [node.Index source.Index weight]); %#ok 
    end
end


