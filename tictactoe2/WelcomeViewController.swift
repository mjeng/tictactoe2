//
//  ViewController.swift
//  tictactoe2
//
//  Created by Matthew Jeng on 6/11/18.
//  Copyright © 2018 Matthew Jeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    var logoView: UIImageView?
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadLogo()
        logoView?.alpha = 0.0
        startButton.alpha = 0.0
        startButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let animationDuration = 5.0
        print("before")
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0.0, options: .calculationModeLinear, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                self.logoView?.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2, animations: {
                self.logoView?.alpha = 0.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4, animations: {
                self.startButton.alpha = 1.0
            })
        }, completion: { Bool in
            self.startButton.isEnabled = true
        })
        
    }
    
    
    func loadLogo() {
        let image = UIImage(named: "app-logo")
        logoView = UIImageView(image: image)
        let imageWidth = image!.size.width
        let imageHeight = image!.size.height
        let newWidth = screenWidth * 0.8
        let newHeight = newWidth / imageWidth * imageHeight
        let newSize = CGSize(width: newWidth, height: newHeight)
        logoView?.frame = CGRect(origin: CGPoint(x: (screenWidth-newWidth)/2, y: (screenHeight-newHeight)/2), size: newSize)
        self.view.addSubview(logoView!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

