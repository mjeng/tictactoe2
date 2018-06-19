///Users/owner/eecs/personal-projects/tictactoe2/tictactoe2.xcodeproj
//  GameViewController.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/17/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, ClickDelegate, GameDelegate {

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    var gridView: GridView!
    var game: Game!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createGame()
    }
    
    func createGame() {
        game = Game(gameDelegate: self)
        let viewWidth = screenWidth * 0.9
        let viewHeight = viewWidth
        let gridFrame = CGRect(x: (screenWidth-viewWidth)/2, y: (screenHeight-viewHeight)/2, width: viewWidth, height: viewHeight)
        gridView = GridView(frame: gridFrame, clickDelegate: self)
        gridView.alpha = 0.0
        gridView.isUserInteractionEnabled = true
        statusLabel.text = "X goes first!"
        statusLabel.alpha = 0.0
        playAgainButton.alpha = 0.0
        playAgainButton.isEnabled = false
        view.addSubview(gridView!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateGameStart()
    }
    
    func animateGameStart() {
        UIView.animate(withDuration: 0.2) {
            self.gridView.alpha = 1.0
        }
        UIView.animate(withDuration: 0.2) {
            self.statusLabel.alpha = 1.0
        }
    }

    func userPressed(button: GridSquare) {
        let currentPlayer = game.getCurrentPlayer()
        let image: UIImage?
        
        switch currentPlayer {
        case .x:
            image = UIImage(named: "x")
            statusLabel.text = "O"
        case .o:
            image = UIImage(named: "o")
            statusLabel.text = "X"
        }
        
        gridView.changeButtonImage(for: button, using: image)
        
        game.userPressed(button: button)

    }
    
    func declareWinner(_ winner: Player) {
        switch winner {
        case .x:
            statusLabel.text = "X is the winner!"
        case .o:
            statusLabel.text = "O is the winner!"
        }
        
        wrapUp()
        
    }
    
    func declareTie() {
        statusLabel.text = "Bummer, it's a tie!"
        wrapUp()
    }
    
    func wrapUp() {
        // Make play again button available
        playAgainButton.isEnabled = true
        UIView.animate(withDuration: 0.2) {
            self.playAgainButton.alpha = 1.0
        }
    }

    @IBAction func playAgain(_ sender: Any) {
        gridView.removeFromSuperview()
        createGame()
        animateGameStart()
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
