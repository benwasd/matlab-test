classdef Motorway < handle
    properties
        Nodes = {}
    end
    
    methods    
        function obj = Motorway(nodes)
            obj.Nodes = nodes;
        end
    end
    
    methods
        function res = deijkstra(obj, startNodeName, finishNodeName)
            startNodePosition = cellfun(@(x) strcmp(x.Name, startNodeName), obj.Nodes, 'UniformOutput', true);
            startNode = obj.Nodes{startNodePosition};
            finishNodePosition = cellfun(@(x) strcmp(x.Name, finishNodeName), obj.Nodes, 'UniformOutput', true);
            finishNode = obj.Nodes{finishNodePosition};
            
            initialize(startNode);
            q = obj.Nodes';
            
            while sum(~cellfun('isempty', q)) > 0
                foobar = min(cellfun(@(x) getAbstandSafe(x), q, 'UniformOutput', true));
                uIndex = find(cellfun(@(x) getAbstandSafe(x) == foobar, q, 'UniformOutput', true));
                u = q{uIndex};
                    
                if numel(uIndex) == 1
                    q{uIndex,:} = [];
                end
                
                connectedNodes = u.connectedNodes();
                for i = 1:numel(connectedNodes(:,1))
                    abstand = connectedNodes{i,1};
                    v = connectedNodes{i,2};
                    
                    if any(cellfun(@(x) isempty(x) == false && x == v, q, 'UniformOutput', true))
                        update(u, v, abstand);
                    end
                end
            end
            
            passedInterchanges = finishNode.Name;            
            node = finishNode;
            minutes = 0;
            while isempty(node.vorgaenger) == false
                node = node.vorgaenger;
                minutes = minutes + node.abstand;
                passedInterchanges = strcat(node.Name, {' '}, passedInterchanges);
            end
            
            res = {passedInterchanges{1}; minutes};
            
            function initialize(start)
                for j = 1:numel(obj.Nodes)
                    obj.Nodes{j}.abstand = realmax;
                    obj.Nodes{j}.vorgaenger = [];
                end
                start.abstand = 0;
            end
            
            function abstand = getAbstandSafe(node) 
                if isempty(node) 
                    abstand = realmax;
                else
                    abstand = node.abstand;
                end 
            end
            
            function update(u, v, abstand)
                alternativ = u.abstand + abstand;
                if alternativ < v.abstand
                    v.abstand = alternativ;
                    v.vorgaenger = u;
                end
            end
        end
        
        function res = kruskal(obj)
            for i = 1:numel(obj.Nodes)
            end
            
            cities = {}; % currently includes interchanges too
            edges = {};
            
            for node = obj.Nodes
                connectedNodes = node{1}.connectedNodes();
                
                for i = 1:numel(connectedNodes{1})
                    edges = vertcat(edges, [node{1}.Index connectedNodes{i,2}.Index connectedNodes{i,1}]); %#ok 
                end
                
                cities = vertcat(cities, {node{1}}); %#ok 
            end
            
            res = '';
        end
               
        function st = getSt(obj) 
            st = [];
            
            for i = 1:numel(obj.Nodes)
                st = x(st, obj.Nodes{i});
            end

            function st = x(st, source)
                connectedNodes = source.connectedNodes();
                for j = 1:size(connectedNodes, 1)
                    weight = connectedNodes{j,1};
                    node = connectedNodes{j,2};
                    st = vertcat(st, [node.Index source.Index weight]); %#ok 
                end
            end
        end
    end
end

