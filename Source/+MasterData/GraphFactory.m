classdef GraphFactory
    methods (Static)
        function swissMotorway = create()
            bern = Model.City('Bern', 1);
            scho = Model.Interchange('Schönbühl', 2);
            biel = Model.City('Biel', 3);
            lute = Model.Interchange('Lutherbach', 4);
            haer = Model.Interchange('Härkingen', 5);
            wigg = Model.Interchange('Wiggertal', 6);
            basl = Model.City('Basel', 7);
            lutz = Model.City('Luzern', 8);
            thun = Model.City('Thun', 9);
            aara = Model.City('Aarau', 10);
            birr = Model.Interchange('Birrfeld', 11);
            likr = Model.Interchange('Limmattaler Kreuz', 12);
            zuos = Model.Interchange('Dreieck Zürich-Ost', 13);
            wint = Model.City('Winterthur', 14);
            zuer = Model.City('Zürich', 15);
            zuwe = Model.Interchange('Zürich West', 16);
            baar = Model.City('Baar (Zug)', 17);
            horg = Model.Interchange('Horgen', 18);
            chur = Model.City('Chur', 19);

            bern.connect(Model.Lane(100, 6.1, 4), scho);
            scho.connect(Model.Lane(100, 6.1, 8), bern);
            scho.connect([Model.Lane(100, 1.5, 0), Model.Lane(120, 23.8, 1)], biel);
            biel.connect([Model.Lane(120, 23.8, 0), Model.Lane(100, 1.5, 5)], scho);
            biel.connect(Model.Lane(80, 17.3, 0), lute);
            lute.connect(Model.Lane(80, 17.3, 0), biel);
            scho.connect(Model.Lane(120, 24.5, 0), lute);
            lute.connect(Model.Lane(120, 24.5, 0), scho);
            lute.connect(Model.Lane(120, 19.6, 0), haer);
            haer.connect(Model.Lane(120, 19.6, 0), lute);
            haer.connect(Model.Lane(120, 7.9, 0), wigg);
            wigg.connect(Model.Lane(120, 7.9, 0), haer);
            haer.connect(Model.Lane(100, 35.9, 0), basl);
            basl.connect(Model.Lane(100, 35.9, 0), haer);
            wigg.connect(Model.Lane(120, 42.6, 0), lutz);
            lutz.connect(Model.Lane(120, 42.6, 0), wigg);
            lutz.connect(Model.Lane(100, 120, 0), thun);
            thun.connect(Model.Lane(120, 25.6, 0), bern);
            bern.connect(Model.Lane(120, 25.6, 0), thun);
            wigg.connect(Model.Lane(120, 20.3, 0), aara);
            aara.connect(Model.Lane(120, 20.3, 0), wigg);
            aara.connect(Model.Lane(50, 11.4, 1), birr);
            birr.connect(Model.Lane(120, 11.4, 0), aara);
            basl.connect(Model.Lane(100, 52.1, 0), birr);
            birr.connect(Model.Lane(120, 16.0, 0), likr);
            likr.connect(Model.Lane(120, 16.0, 0), birr);
            likr.connect(Model.Lane(100, 12.8, 0), zuos);
            zuos.connect(Model.Lane(100, 12.8, 0), likr);
            zuos.connect([Model.Lane(80, 4, 0), Model.Lane(120, 15.9, 0)], wint);
            wint.connect([Model.Lane(120, 15.9, 0), Model.Lane(80, 4, 0)], zuos);
            zuos.connect(Model.Lane(100, 4.4, 6), zuer);
            zuer.connect(Model.Lane(100, 4.4, 0), zuos);
            likr.connect(Model.Lane(80, 9, 10), zuer);
            zuer.connect(Model.Lane(80, 9, 10), likr);
            likr.connect(Model.Lane(100, 9.9, 0), zuwe);
            zuwe.connect(Model.Lane(100, 9.9, 0), likr);
            zuwe.connect(Model.Lane(120, 27.5, 0), baar);
            baar.connect(Model.Lane(120, 27.5, 0), zuwe);
            baar.connect(Model.Lane(80, 13.6, 0), horg);
            horg.connect(Model.Lane(80, 13.6, 0), baar);
            zuwe.connect(Model.Lane(100, 19.2, 0), horg);
            horg.connect(Model.Lane(100, 19.2, 0), zuwe);
            zuwe.connect(Model.Lane(80, 10.5, 6), zuer);
            zuer.connect(Model.Lane(80, 10.5, 0), zuwe);
            baar.connect(Model.Lane(120, 28.6, 0), lutz);
            lutz.connect(Model.Lane(120, 28.6, 0), baar);
            horg.connect(Model.Lane(100, 99.4, 0), chur);
            chur.connect(Model.Lane(100, 99.4, 0), horg);
            
            swissMotorway = Model.Motorway([bern scho biel lute haer wigg basl lutz thun aara birr likr zuos wint zuer zuwe baar horg chur]);
        end
    end
end

