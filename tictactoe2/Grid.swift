//
//  Grid.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/11/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import Foundation

class Grid {
    
    let xdim = 3
    let ydim = 3
    let grid: [[GridValue]]
    
    init() {
        grid = Array(repeating: Array(repeating: GridValue.empty, count: xdim), count: ydim)
    }
    
    func insertGridValue(_ value: GridValue, at position: (Int, Int)) {
        
    }
    
}
