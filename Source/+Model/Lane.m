classdef Lane < handle
    properties (SetAccess = private)
        SpeedLimit = 120
        Length = 0
        AdditionalTime = 0
        To
    end
    
    methods
        function obj = Lane(speedLimit, length, additionalTime) 
            obj.SpeedLimit = speedLimit;
            obj.Length = length;
            obj.AdditionalTime = additionalTime;
        end
        
        % Mutates state
        function obj = connectTo(obj, to)
            obj.To = to;
        end
        
        function time = weight(obj)
            timeAtFullSpeed = obj.Length / (obj.SpeedLimit / 60);
            time = timeAtFullSpeed + obj.AdditionalTime;
        end
        
        function r = plus(obj1, obj2)
            r = horzcat(obj1, obj2);
        end
    end
    
    methods
    end
end

