//
//  ViewController.swift
//  UILongPressGestureRecognizer
//
//  Created by Mav3r1ck on 12/3/14.
//  Copyright (c) 2014 Mav3r1ck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cloudOne: UIView!
    @IBOutlet weak var cloudTwo: UIImageView!
    @IBOutlet weak var cloudThree: UIImageView!
    @IBOutlet weak var cloudFour: UIImageView!
    @IBOutlet weak var Sun: UIView!
    
    let longPressRec = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view, typically from a nib.
        longPressRec.addTarget(self, action: "longPressedView")
        longPressRec.minimumPressDuration = 1.0
        self.cloudOne.addGestureRecognizer(longPressRec)
        cloudOne.userInteractionEnabled = true
        
        //swipeUp
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        cloudOne.hidden = true
        cloudTwo.hidden = true
        cloudThree.hidden = true
        cloudFour.hidden = true
        Sun.hidden = true
        
        //swipeDown
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func longPressedView(){

        Sun.hidden = false
        
        self.Sun.transform = CGAffineTransformMakeTranslation(0, -350)
        springWithDelay(6.0, 0.7, {
            self.Sun.transform = CGAffineTransformMakeTranslation(0, 0)
        })
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
      
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Up:
                
                cloudOne.hidden = false
                cloudTwo.hidden = false
                cloudThree.hidden = false
                cloudFour.hidden = false
                
                self.cloudOne.transform = CGAffineTransformMakeTranslation(370, 0)
                springWithDelay(6.0, 1.0, {
                    self.cloudOne.transform = CGAffineTransformMakeTranslation(0, 0)
                })
                
                self.cloudTwo.transform = CGAffineTransformMakeTranslation(-370, 0)
                springWithDelay(6.0, 0.5, {
                    self.cloudTwo.transform = CGAffineTransformMakeTranslation(0, 0)
                })
                
                self.cloudThree.transform = CGAffineTransformMakeTranslation(350, 0)
                springWithDelay(6.0, 0.3, {
                    self.cloudThree.transform = CGAffineTransformMakeTranslation(0, 0)
                })
                
                self.cloudFour.transform = CGAffineTransformMakeTranslation(-350, 0)
                springWithDelay(6.0, 0.7, {
                    self.cloudFour.transform = CGAffineTransformMakeTranslation(0, 0)
                })
                
            case UISwipeGestureRecognizerDirection.Down:
            
                Sun.hidden = true
            
            default:
                break
            }
        }
    }
    
}