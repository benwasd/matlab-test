classdef City < Model.Node   
    methods
        function obj = City(name, index)
            obj = obj@Model.Node(name, index);
        end
    end
end

