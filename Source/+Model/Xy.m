classdef Xy < Model.Interchange & Model.City
    methods
        function obj = Xy(name, index)
            obj@Model.Interchange(name, index);
            obj@Model.City(name, index);
        end
    end
end

