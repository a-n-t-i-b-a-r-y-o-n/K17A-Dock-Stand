Length = 23.5;
Width = 112;
Height = 1.5;

// Draw legs
legs(L = Length, W = Width);
mirror([1, 0, 0])
    legs(L = Length, W = Width);
    
// Base
base(Length, Width, Height);

module support(L = 23.5, W = 7, H = 34) {
    
    Points = [
        // Bottom vertices
        [0, 0, 0], //0
        [0, W, 0], //1
        [L, W, 0], //2
        [L, 0, 0], //3
        // Top points
        [0, W, H], //4
        [0, 0, H]  //5
        
    ];
    
    Faces = [
        // Bottom face
        [0, 3, 2, 1],
        // Backside
        [0, 1, 4, 5],
        // Sides
        [0, 5, 3],
        [1, 2, 4],
        // Top
        [2, 3, 5, 4]
    ];
    
    polyhedron(Points, Faces);
}

module legs(L = 23.5, W = 112, Inset = 24) {
       
    translate([L / 2, Inset, 0])
        support(L);
    
    translate([L / 2, W - Inset - 7, 0])
        support(L);
}

module base(L = 23.5, W = 112, H = 2) {
    translate([-((L / 2) + 1), 20, 0]){
        difference(){
            cube([L + 2, W - (20 * 2), H]);
            translate([5, 4, -1])
                cube([L - 8, W - 8 - (20 * 2), H + 2]);
        }
    }
}