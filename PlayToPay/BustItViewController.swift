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
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGame()
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
        timeLabel.text = "\(seconds)"
        
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
        mainButton.backgroundColor = FlatGreen()
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
        timeLabel.text = "\(seconds)"
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
