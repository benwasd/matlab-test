classdef Motorway
    properties
        Nodes = []
    end
    
    methods    
        function obj = Motorway(nodes)
            obj.Nodes = nodes;
        end
    end
    
    methods
        function res = deijkstra(obj, startNodeName, finishNodeName)
            startNodePosition = arrayfun(@(x) strcmp(x.Name, startNodeName), obj.Nodes, 'UniformOutput', true);
            startNode = obj.Nodes(startNodePosition);
            finishNodePosition = arrayfun(@(x) strcmp(x.Name, finishNodeName), obj.Nodes, 'UniformOutput', true);
            finishNode = obj.Nodes(finishNodePosition);
            
            initialize(startNode);
            q = obj.Nodes';
            
            while sum(~arrayfun(@(x) isempty(x), q)) > 0
                minAbstand = min(arrayfun(@(x) getAbstandSafe(x), q, 'UniformOutput', true));
                uIndex = find(arrayfun(@(x) getAbstandSafe(x) == minAbstand, q, 'UniformOutput', true));
                u = q(uIndex);
                    
                if numel(uIndex) == 1
                    q(uIndex,:) = [];
                end
                
                connectedNodes = u.connectedNodes();
                for i = 1:numel(connectedNodes(:,1))
                    abstand = connectedNodes{i,1};
                    v = connectedNodes{i,2};
                    
                    if any(arrayfun(@(x) isempty(x) == false && x == v, q, 'UniformOutput', true))
                        update(u, v, abstand);
                    end
                end
            end
            
            passedInterchanges = finishNode.Name;            
            node = finishNode;
            while isempty(node.vorgaenger) == false
                node = node.vorgaenger;
                passedInterchanges = strcat(node.Name, {', '}, passedInterchanges);
            end
            
            res = {passedInterchanges{1}; finishNode.abstand};
            
            function initialize(start)
                for n = obj.Nodes
                    n.abstand = realmax;
                    n.vorgaenger = [];
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
            cities = []; % currently includes interchanges too
            edges = [];
            
            for node = obj.Nodes
                connectedNodes = node.connectedNodes();
                
                for i = 1:size(connectedNodes, 1)
                    edges = vertcat(edges, [connectedNodes{i,1} node.Index connectedNodes{i,2}.Index]); %#ok 
                end
                
                cities = vertcat(cities, node); %#ok 
            end
            
            edges = sortrows(edges);
            
            
            
            res = '';
        end
               
        function st = getSt(obj) 
            st = [];
            
            for n = obj.Nodes
                st = x(st, n);
            end

            function st = x(st, source)
                connectedNodes = source.connectedNodes();
                for j = 1:size(connectedNodes, 1)
                    weight = connectedNodes{j,1};
                    node = connectedNodes{j,2};
                    st = vertcat(st, [source.Index node.Index weight]); %#ok 
                end
            end
        end
    end
end

