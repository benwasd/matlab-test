clear

bern = Model.Node('Bern', 1);
scho = Model.Node('Schönbühl', 2);
biel = Model.Node('Biel', 3);
lute = Model.Node('Luterbach', 4);
haer = Model.Node('Härkingen', 5);
oftr = Model.Node('Oftringen', 6);
basl = Model.Node('Basel', 7);

zuer = Model.Node('Zürich', 5);

bern.connect(Model.Lane(100, 6.1, 0), scho);
scho.connect(Model.Lane(100, 6.1, 10), bern);
scho.connect([Model.Lane(100, 1.5, 0), Model.Lane(120, 23.8, 0)], biel);
biel.connect([Model.Lane(120, 23.8, 0), Model.Lane(100, 1.5, 0)], scho);
biel.connect(Model.Lane(80, 17.3, 0), lute);
lute.connect(Model.Lane(80, 17.3, 0), biel);
scho.connect(Model.Lane(120, 24.5, 0), lute);
lute.connect(Model.Lane(120, 24.5, 0), scho);
lute.connect(Model.Lane(120, 19.6, 0), haer);
haer.connect(Model.Lane(120, 19.6, 0), lute);
haer.connect(Model.Lane(120, 7.9, 8), oftr);
oftr.connect(Model.Lane(120, 7.9, 2), haer);
haer.connect(Model.Lane(100, 35.9, 0), basl);
basl.connect(Model.Lane(100, 35.9, 0), haer);

st = [];
st = x(st, bern);
st = x(st, scho);
st = x(st, biel);
st = x(st, lute);
st = x(st, haer);
st = x(st, oftr);
st = x(st, basl);

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


