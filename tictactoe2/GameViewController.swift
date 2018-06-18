///Users/owner/eecs/personal-projects/tictactoe2/tictactoe2.xcodeproj
//  GameViewController.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/17/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    var gridView: GridView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let viewWidth = screenWidth * 0.9
        let viewHeight = viewWidth
        let gridFrame = CGRect(x: (screenWidth-viewWidth)/2, y: (screenHeight-viewHeight)/2, width: viewWidth, height: viewHeight)
        gridView = GridView(frame: gridFrame)
        gridView?.alpha = 0.0
        view.addSubview(gridView!)
    }
    


    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.gridView?.alpha = 1.0
        }
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
