//
//  RapidFireViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import HTPressableButton
import ChameleonFramework

class RapidFireViewController: UIViewController {

    var count = 0
    var seconds = 1
    var timer = NSTimer()
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawButton()
        setupGame()
    }
    
    func drawButton() {
        let buttonFrame = CGRectMake(0, 0, 150, 150)
        
        let button = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Circular)
        button.buttonColor = FlatPink()
        button.shadowColor = FlatPinkDark()
        
        button.setTitle("HIT ME", forState: UIControlState.Normal)
        
        button.addTarget(self, action: "buttonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
        button.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.view)
            make.centerX.equalTo(self.view)
        }
    }
    
    func setupGame()  {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        seconds = 15
        count = 0
        
        timerLabel.text = "\(seconds)"
        scoreLabel.text = "\(count)"
    }
    
    func buttonPressed()  {
        count++
        scoreLabel.text = "\(count)"
    }
    
    func subtractTime() {
        seconds--
        timerLabel.text = "\(seconds)"
        
        if(seconds == 0)  {
            timer.invalidate()
            
            let _ = NSTimer(timeInterval: 0.5, target: self, selector: "blinkTimerLabel", userInfo: nil, repeats: false)
            
            performSelector("goToResults", withObject: nil, afterDelay: 0.5)
        }
    }
    
    func blinkTimerLabel() {
        print("blink timer label")
        self.timerLabel.hidden = !self.timerLabel.hidden
    }
    
    func goToResults() {
        performSegueWithIdentifier("toResults", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! MinigameResultsViewController
        destVC.score = Int(scoreLabel.text!)
    }

}
