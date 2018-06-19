//
//  GridSquare.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/17/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import UIKit

class GridSquare: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    typealias Coordinate = (Int, Int)
    var pos: Coordinate
    
    init(frame: CGRect, pos: Coordinate) {
        self.pos = pos
        super.init(frame: frame)
    }

}

