package com.badjelly.life {

    // Class to represent a life colony
    public class Colony {

        private var cells:Array;    // Cells in the colony
        private var generation:int; // How many generations have lived
        private var cellCount:int;  // How many cells are in the colony

        private var minX:int;
        private var maxX:int;
        private var minY:int;
        private var maxY:int;

        // Construct new colony
        public function Colony() {
            cells = new Array();
            generation = 1;
            cellCount = 0;
            minX = 0;
            maxX = 0;
            minY = 0;
            maxY = 0;
        }

        // Add cell to colony unless it is already there
        public function addCell( cell:Cell ):void {
            if ( !  cells[cell.getKey()] ) {
                cells[cell.getKey()] = cell;
                cellCount++;
                if ( cell.getX() < minX ) minX = cell.getX();
                if ( cell.getX() > maxX ) maxX = cell.getX();
                if ( cell.getY() < minY ) minY = cell.getY();
                if ( cell.getY() > maxY ) maxY = cell.getY();
            }
        }

        // Delete cell from colony if it is there
        public function delCell( cell:Cell ):void {
            if ( cells[cell.getKey()] ) {
                delete cells[cell.getKey()];
                cellCount--;
            }
        }

        // Create new colony by applying life rules to old colony
        public function regenerate():void {

            var seenCells:Array = new Array(); // So we know which cells we have already processed
            var oldCells:Array = cells;        // Take copy of old colony
            cells = new Array();               // Create new colony
            cellCount = 0;                     // Start counting cells in new colony

            // Loop through cells
            for each ( var oldCell:Cell in oldCells ) {

                // Get coordinates of old cell
                var cx:int = oldCell.getX();
                var cy:int = oldCell.getY();

                // Test old cell and it's neighbours
                for ( var nx:int = cx - 1; nx < cx + 2; nx++ ) {
                    for ( var ny:int = cy - 1; ny < cy + 2; ny++ ) {
                        var candidate:Cell = new Cell( nx, ny );

                        // Only process cells once
                        if ( ! seenCells[candidate.getKey()] ) {
                            seenCells[candidate.getKey()] = true;

                            // Count candidate's neighbours in old colony
                            var count:int = countNeighbours( candidate, oldCells );

                            // Determine if new cell should be alive
                            if ( count == 3 || ( count == 2 && oldCells[candidate.getKey()] ) ) {
                                addCell( candidate );
                            }
                        }
                    }
                }
            }

            generation++; // Count generations
        }

        // Count neighbours of a cell
        public function countNeighbours( cell:Cell, cells:Array ):int {

            var cx:int = cell.getX();
            var cy:int = cell.getY();
            var count:int = 0;

            // Loop through neighbours
            for ( var nx:int = cx - 1; nx < cx + 2; nx++ ) {
                for ( var ny:int = cy - 1; ny < cy + 2; ny++ ) {
                    if ( nx != cx || ny != cy ) {
                        var neighbour:Cell = new Cell( nx, ny );

                        // Count neighbours
                        if ( cells[neighbour.getKey()] ) {
                            count++;
                        }
                    }
                }
            }

            return count;
        }

        // Kill a live cell, recreate a dead cell, return the new status
        public function toggle( cell:Cell ):Boolean {
           if ( cells[cell.getKey()] ) {
               delCell( cell );
               return false;
           } else {
               addCell( cell );
               return true;
           }
        }

        // How many generations have existed
        public function getGeneration():int {
            return generation;
        }

        // How many cells are there
        public function getCellCount():uint {
            return cellCount;
        }

        // Allow calling program to view list of cells
        public function getCells():Array {
            return cells;
        }

        public function getMinX():int {
            return minX;
        }

        public function getMaxX():int {
            return maxX;
        }

        public function getMinY():int {
            return minY;
        }

        public function getMaxY():int {
            return maxY;
        }

    }
}
