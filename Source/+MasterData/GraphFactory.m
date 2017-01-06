classdef GraphFactory
    methods (Static)
        function swissMotorway = create()
            bern = Model.City('Bern', 1);
            scho = Model.Interchange('Schönbühl', 2);
            biel = Model.City('Biel', 3);
            lute = Model.Interchange('Lutherbach', 4);
            haer = Model.Interchange('Härkingen', 5);
            oftr = Model.Interchange('Oftringen', 6);
            basl = Model.City('Basel', 7);
            lutz = Model.City('Luzern', 8);
            thun = Model.City('Thun', 9');

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
            oftr.connect(Model.Lane(120, 42.6, 0), lutz);
            lutz.connect(Model.Lane(120, 42.6, 0), oftr);
            lutz.connect(Model.Lane(100, 106, 0), thun);
            thun.connect(Model.Lane(120, 25.6, 0), bern); 

            swissMotorway = Model.Motorway({bern scho biel lute haer oftr basl lutz thun});
        end
    end
end

