package com.badjelly.life {

    // Cell to represent a life cell
    public class Cell {

        // Coordinates of cell
        private var cx:int;
        private var cy:int;

        // Construct new cell
        public function Cell( cx:int, cy:int ) {
            this.cx = cx;
            this.cy = cy;
        }

        // Get x coordinate of cell
        public function getX():int {
            return cx;
        }

        // Get y coordinate of cell
        public function getY():int {
            return cy;
        }

        // Get key consisting of both coordinates
        public function getKey():String {
            return cx+":"+cy;
        }
    }
}
