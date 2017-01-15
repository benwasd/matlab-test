classdef Mensch
    properties 
        Name = 'Peter'
    end
    
    methods
        function x = definiereEssen(obj, essen) 
            anz = 0;
            x = @do;
                       
            function do() 
                anz = anz + 1;
                fprintf('%s isst %s, er hat schon %d gehabt.\n', obj.Name, essen, anz);
            end
        end
    end
end

