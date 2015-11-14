//
//  BustItViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/27/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//
// Game created by Nick Tailhardat

import UIKit
import ChameleonFramework

class BustItViewController: UIViewController {
    
    var timing = 0
    var timingFreeze = 0
    
    var count = 0
    var seconds = 0
    var canTap = 0
    var round = 0
    var timer = NSTimer()
    
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCountdown()
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
            setupGame()
        }
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if(canTap == 1) {
            let tempscore = 500 + timingFreeze - seconds
            count += tempscore
            scoreLabel.text = "\(count)"
        }
        resetRound()
    }
    
    func randomCGFloat() -> Float {
        return Float(arc4random()) /  Float(UInt32.max)
    }
    
    func addTime() {
        seconds++
        
        if(seconds == 1000 || round == 3)  {
            timer.invalidate()
            
            performSelector("goToResults", withObject: nil, afterDelay: 0.5)
        }
        
        if(seconds > timing) {
            screenSwitch()
        }
    }
    
    func screenSwitch() {
        timingFreeze = timing
        mainButton.backgroundColor = FlatMint()
        canTap = 1
    }
    
    func resetRound() {
        seconds = 0
        round++
        canTap = 0
        timingFreeze = 0
        mainButton.backgroundColor = UIColor.whiteColor()
        timing = Int(randomCGFloat()*300+200)
    }
    
    func setupGame()  {
        resetRound()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("addTime"), userInfo: nil, repeats: true)
        count = 0
        round = 0
        mainButton.backgroundColor = UIColor.whiteColor()
        scoreLabel.text = "\(count)"
    }

    func goToResults() {
        performSegueWithIdentifier("toResults", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! MinigameResultsViewController
        destVC.score = Int(scoreLabel.text!)
    }

}
