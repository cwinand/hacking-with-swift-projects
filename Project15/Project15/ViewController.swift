//
//  ViewController.swift
//  Project15
//
//  Created by Winand, Christopher on 11/2/15.
//  Copyright © 2015 Winand, Christopher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tap: UIButton!
    
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapped(sender: UIButton) {
        
        tap.hidden = true
        
        UIView.animateWithDuration(1, delay: 0, options: [],
            animations: { [unowned self] in
                switch self.currentAnimation {
                case 0:
                    self.imageView.transform = CGAffineTransformMakeScale(2, 2)
                case 1:
                    self.imageView.transform = CGAffineTransformIdentity
                case 2:
                    self.imageView.transform = CGAffineTransformMakeTranslation(-256, -256)
                case 3:
                    self.imageView.transform = CGAffineTransformIdentity
                case 4:
                    self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))                    
                case 5:
                    self.imageView.transform = CGAffineTransformIdentity
                case 6:
                    self.imageView.alpha = 0.1
                    self.imageView.backgroundColor = UIColor.greenColor()
                case 7:
                    self.imageView.alpha = 1
                    self.imageView.backgroundColor = UIColor.clearColor()
                default:
                    break
                }
            
            }) { [unowned self] (finished: Bool) in
                self.tap.hidden = false
        }
        ++currentAnimation
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }

}

