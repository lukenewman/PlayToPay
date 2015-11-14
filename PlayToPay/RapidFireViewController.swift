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
        
        setupCountdown()
    }
    
    func drawButton() {
        let buttonFrame = CGRectMake(0, 0, 150, 150)
        
        let button = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Circular)
        button.buttonColor = FlatRed()
        button.shadowColor = FlatRedDark()
        
        button.setTitle("HIT ME", forState: UIControlState.Normal)
        
        button.addTarget(self, action: "buttonPressed", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
        
        button.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.view)
            make.centerX.equalTo(self.view)
        }
    }
    
    var timeLeft = 3
    var countdownTimer = NSTimer()
    var countdownTimerLabel: UILabel!
    
    func setupCountdown() {
        self.countdownTimerLabel = UILabel(frame: self.view.frame)
        self.countdownTimerLabel.text = "\(timeLeft)"
        self.countdownTimerLabel.textColor = FlatWhite()
        self.countdownTimerLabel.backgroundColor = Festivity.theFestivity.game.themeColor
        self.countdownTimerLabel.font = UIFont(name: "Aleo-Bold", size: 150)
        self.countdownTimerLabel.textAlignment = .Center
        
        self.view.addSubview(self.countdownTimerLabel)
        
        self.countdownTimerLabel.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
        countdownTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractCountdown"), userInfo: nil, repeats: true)
    }
    
    func subtractCountdown() {
        timeLeft--
        countdownTimerLabel.text = "\(timeLeft)"
        
        if (timeLeft == 0)  {
            countdownTimer.invalidate()
            self.countdownTimerLabel.removeFromSuperview()
            drawButton()
            setupGame()
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
