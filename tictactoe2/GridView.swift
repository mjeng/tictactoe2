//
//  Game.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/17/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import UIKit

protocol ClickDelegate: class {
    func userPressed(button: GridSquare)
}

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
    let clickDelegate: ClickDelegate

    init(frame: CGRect, clickDelegate: ClickDelegate) {
        self.clickDelegate = clickDelegate
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
        
        let transformVals: (CGFloat, CGFloat) = (6.0, 0.9)
        let translate = CGAffineTransform(translationX: transformVals.0, y: transformVals.0)
        let scale = CGAffineTransform(scaleX: transformVals.1, y: transformVals.1)
        
        let buttonWidth = frame.width/3
        let buttonHeight = frame.height/3
        
        let buttonSize = CGSize(width: buttonWidth, height: buttonHeight).applying(scale)
        
        
        for i in 0..<xdim {
            for j in 0..<ydim {
                let x: CGFloat = frame.width/3 * CGFloat(i)
                let y: CGFloat = frame.height/3 * CGFloat(j)
                let buttonOrigin = CGPoint(x: x, y: y)
                
                let buttonFrame = CGRect(origin: buttonOrigin.applying(translate), size: buttonSize)
                let button = GridSquare(frame: buttonFrame, pos: (i, j))
                
                button.addTarget(self, action: #selector(userPressed(button:)), for: .touchUpInside)

                self.addSubview(button)
            }
        }
        
    }
    
    @objc func userPressed(button: GridSquare!) {
        clickDelegate.userPressed(button: button)
    }
    
    func changeButtonImage(for button: GridSquare, using image: UIImage?) {
        button.setImage(image, for: .normal)
    }
    
    

}

enum StatusLabel: String {
    case x = "X"
    case o = "O"
}
