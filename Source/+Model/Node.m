classdef Node < handle
    properties
        Out = []
        In = []
    end
    
    properties (SetAccess = private)
        Name = ''
        Index = 0
    end
    
    methods
        function obj = Node(name, index)
            obj.Name = name;
            obj.Index = index;
        end
                
        function connect(obj, lanes, node)
            obj.Out = [obj.Out lanes(1)];
            node.In = [node.In lanes(end)];
            
            lanesReversed = fliplr(lanes);
            
            nextNodeOrLane = node;
            for lane = lanesReversed
                lane.connectTo(nextNodeOrLane);
                nextNodeOrLane = lane;
            end
        end
        
        function result = connectedNodes(obj)
            result = {};
            for lane = obj.Out
                x = lane;
                weight = lane.weight();
                while isa(x.To, 'Model.Lane') 
                    x = x.To; 
                    weight = weight + x.weight();
                end
                result = vertcat(result, {weight x.To}); %#ok
            end
        end
    end
end

