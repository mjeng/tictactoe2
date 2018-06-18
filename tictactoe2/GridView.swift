//
//  Game.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/17/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import UIKit

class GridView: UIImageView {

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
    
    let xdim = 3
    let ydim = 3
    var grid: [[GridSquare?]] = [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

    override init(frame: CGRect) {
//        for i in 0..<xdim {
//            for j in 0..<ydim {
//                self.grid[i][j] = nil
//            }
//        }
        super.init(frame: frame)
        loadGrid()
        createButtons()
    }
    
    
    func loadGrid() -> () { // (maybe) TODO do some refactoring here; the image is supposed to take up the entire view
        let viewWidth = frame.width
        let viewHeight = frame.height
        let gridImage = UIImage(named: "grid")
        let gridView = UIImageView(image: gridImage)
        let imageWidth = gridImage!.size.width
        let imageHeight = gridImage!.size.height
        let gridWidth = viewWidth
        let gridHeight = gridWidth / imageWidth * imageHeight
        let gridSize = CGSize(width: gridWidth, height: gridHeight)
        let gridOrigin = CGPoint(x: (viewWidth-gridWidth)/2, y: (viewHeight-gridHeight)/2)
        gridView.frame = CGRect(origin: gridOrigin, size: gridSize)
        self.addSubview(gridView)
    }
    
    func createButtons() -> () { // NOTE this function was made assuming the UIView and image sizes were identical
        
        let buttonWidth = frame.width/3
        let buttonHeight = frame.height/3
        let buttonSize = CGSize(width: buttonWidth, height: buttonHeight)
        
        for i in 0..<xdim {
            for j in 0..<ydim {
                let x: CGFloat = frame.width/3 * CGFloat(i)
                let y: CGFloat = frame.height/3 * CGFloat(j)
                let buttonOrigin = CGPoint(x: x, y: y)
                
                let buttonFrame = CGRect(origin: buttonOrigin, size: buttonSize)
                let button = GridSquare(frame: buttonFrame)
                
                grid[i][j] = button
                self.addSubview(button)
            }
        }
    }
    
    

}
