//
//  GameViewController.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/17/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadGrid()
        createButtons()
    }
    
    func loadGrid() -> () {
        let gridImage = UIImage(named: "grid")
        let gridView = UIImageView(image: gridImage)
        view.addSubview(gridView)
    }

    func createButtons() -> () {
        
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
