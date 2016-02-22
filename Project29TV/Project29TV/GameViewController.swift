//
//  GameViewController.swift
//  Project29TV
//
//  Created by Winand, Christopher on 11/6/15.
//  Copyright (c) 2015 Winand, Christopher. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var currentGame: GameScene!
    
    // MARK: Outlets
    @IBOutlet weak var angleField: UITextField!
    @IBOutlet weak var angleLabel: UILabel!
    @IBOutlet weak var velocityField: UITextField!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var launchButton: UIButton!
    @IBOutlet weak var playerNumber: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene(fileNamed: "GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
            currentGame = scene
            scene.viewController = self
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: Actions
    @IBAction func angleChanged(sender: AnyObject!) {
        if let angleAsInt = Int(angleField.text!) {
            angleLabel.text = "Angle: \(angleAsInt)"
        } else {
            angleLabel.text = "Angle:"
        }
    }
    
    @IBAction func velocityChanged(sender: AnyObject!) {
        if let velocityAsInt = Int(velocityField.text!) {
            velocityLabel.text = "Velocity: \(velocityAsInt)"
        } else {
            velocityLabel.text = "Velocity:"
        }
    }
    
    @IBAction func launch(sender: AnyObject!) {
        angleLabel.hidden = true
        angleField.hidden = true
        
        velocityLabel.hidden = true
        velocityField.hidden = true
        
        launchButton.hidden = true
        
        if let angleAsInt = Int(angleField.text!) {
            if let velocityAsInt = Int(velocityField.text!) {
                currentGame.launch(angle: angleAsInt, velocity: velocityAsInt)
            } else {
                //Message that velocity needs to be a number
            }
        } else {
            //Message that angle field needs to be a number
        }
    }
    
    func activatePlayerNumber(number: Int) {
        if number == 1 {
            playerNumber.text = "<<< PLAYER ONE"
        } else {
            playerNumber.text = "PLAYER TWO >>>"
        }
        
        angleField.hidden = false
        angleLabel.hidden = false
        
        velocityField.hidden = false
        velocityLabel.hidden = false
        
        launchButton.hidden = false
    }
    
    
}
