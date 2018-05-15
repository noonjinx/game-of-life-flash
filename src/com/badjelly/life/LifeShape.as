package com.badjelly.life {

    import mx.collections.ArrayCollection;

    // Factory class to create colonies containing predefined shapes
    public class LifeShape {

        // Array of permissible shape names
        private static var shapes:ArrayCollection = new ArrayCollection(
            [ {shape:"Empty"},
              {shape:"F-pentomino"},
              {shape:"Acorn"},
              {shape:"Bunnies"},
              {shape:"Lidka"},
              {shape:"Glider"},
              {shape:"Lightweight Spaceship"},
              {shape:"Gosper Glider Gun"},
              {shape:"Puffer Train"}
        ] );

        private var left:int;      // x-coordinate of leftmost cell in shape
        private var top:int;       // y-coordinate of topmost cell in shape
        private var sy:int;        // Current offset from y corrdinate
        private var colony:Colony; // Colony containing shape

        // Factory method to get new colony containing shape
        // Screen dimenisons are required so shape can be palced at ideal position
        public function makeColony( type:String, width:int, height:int ):Colony {

            left = 0;              // x-coordinate of leftmost cell in shape
            top = 0;               // y-coordinate of topmost cell in shape
            sy = 0;                // Current offset from y corrdinate
            colony = new Colony(); // Colony containing shape

            // Define each shape and add to colony
            if ( type == "Glider" ) {
                left = 0 - width / 2 + 2;
                top = 0 - height / 2 + 2;
                addRow(".O.");
                addRow("..O");
                addRow("OOO");
            } else if ( type == "Gosper Glider Gun" ) {
                left = 0 - width / 2 + 2;
                top = 0 - height / 2 + 2;
                addRow("........................O");
                addRow("......................O.O");
                addRow("............OO......OO............OO");
                addRow("...........O...O....OO............OO");
                addRow("OO........O.....O...OO");
                addRow("OO........O...O.OO....O.O");
                addRow("..........O.....O.......O");
                addRow("...........O...O");
                addRow("............OO");
            } else if ( type == "Lightweight Spaceship" ) {
                left = 0 - width / 2 + 2;
                top = 0 - 2;
                addRow("O..O.");
                addRow("....O");
                addRow("O...O");
                addRow(".OOOO");
            } else if ( type == "Puffer Train" ) {
                left = 0 - width / 2 + 2;
                top = 0 - 9;
                addRow("...O.");
                addRow("....O");
                addRow("O...O");
                addRow(".OOOO");
                addRow(".....");
                addRow(".....");
                addRow(".....");
                addRow("O....");
                addRow(".OO..");
                addRow("..O..");
                addRow("..O..");
                addRow(".O...");
                addRow(".....");
                addRow(".....");
                addRow("...O.");
                addRow("....O");
                addRow("O...O");
                addRow(".OOOO");
            } else if ( type == "F-pentomino" ) {
                left = 0 - 1;
                top = 0 - 1;
                addRow(".OO");
                addRow("OO.");
                addRow(".O.");
            } else if ( type == "Bunnies" ) {
                left = 0 - 4;
                top = 0 - 2;
                addRow("O.....O.");
                addRow("..O...O.");
                addRow("..O..O O");
                addRow(".O.O....");
            } else if ( type == "Lidka" ) {
                left = 0 - 5;
                top = 0 - 8;
                addRow(".O.......");
                addRow("O.O......");
                addRow(".O.......");
                addRow(".........");
                addRow(".........");
                addRow(".........");
                addRow(".........");
                addRow(".........");
                addRow(".........");
                addRow(".........");
                addRow("........O");
                addRow("......O.O");
                addRow(".....OO.O");
                addRow(".........");
                addRow("....OOO..");
            } else if ( type == "Acorn" ) {
                left = 0 - 4;
                top = 0 - 1;
                addRow(".O.....");
                addRow("...O...");
                addRow("OO..OOO");
            }

            return colony; // Return constructed colony
        }

        // Add a row of shape to colony
        private function addRow( row:String ):void {
            for ( var sx:int = 0; sx < row.length; sx++) {
                if ( row.charAt(sx) == 'O' ) {
                    colony.addCell( new Cell( left + sx, top + sy ) );
                }
            }
            sy++;
        }

        // Return list of permissible shapes to calling program
        public static function getShapes():ArrayCollection {
            return shapes;
        }
    }
}
