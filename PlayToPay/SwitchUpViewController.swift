//
//  SwitchUpViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/27/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import ChameleonFramework

class SwitchUpViewController: UIViewController {

    var count = 0
    var seconds = 0
    
    var timer = NSTimer()
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
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
    
    func randomCGFloat() -> Float {
        return Float(arc4random()) /  Float(UInt32.max)
    }
    
    func subtractTime() {
        seconds--
        timerLabel.text = "\(seconds)"
        
        if(seconds == 0)  {
            timer.invalidate()
            
            performSelector("goToResults", withObject: nil, afterDelay: 0.5)
        }
    }
    
    @IBAction func buttonPress(sender: UIButton) {
        if (sender.backgroundColor == FlatOrange()) {
            count++
        } else {
            count--
        }
        
        if (randomCGFloat() < 0.5) {
            leftButton.backgroundColor = FlatOrange()
            rightButton.backgroundColor = FlatWhite()
        } else {
            leftButton.backgroundColor = FlatWhite()
            rightButton.backgroundColor = FlatOrange()
        }
        
        scoreLabel.text = "\(count)"
        
    }
    
    func setupGame()  {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        count = 0
        seconds = 15
        leftButton.backgroundColor = FlatOrange()
        rightButton.backgroundColor = FlatWhite()
        timerLabel.text = "\(seconds)"
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
