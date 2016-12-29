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
        
        function obj = connectTo(obj, to)
            obj.To = to;
        end
        
        function time = weight(obj)
            timeAtFullSpeed = obj.SpeedLimit / 60 * obj.Length;
            time = timeAtFullSpeed + obj.AdditionalTime;
        end
    end
    
    methods
    end
end

