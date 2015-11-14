//
//  ControlPanelViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 10/27/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import Foundation
import ChameleonFramework
import HTPressableButton

class ControlPanelViewController: UIViewController {
    
    let colors = [FlatBlue(), FlatGreen(), FlatOrange(), FlatMagenta(), FlatYellow()]
    
    var count = 0
    var seconds = 0
    
    var timer = NSTimer()
    
    lazy var buttons: [UIButton] = {
        var tempButtons: [UIButton] = []
        for view in self.view.subviews {
            if let button = view as? UIButton {
                tempButtons.append(button)
            }
        }
        return tempButtons
    }()
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var buttonViews: [UIView]!
    
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
            setupButtons()
            setButtonColors()
        }
    }
    
    func setupGame() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
        count = 0
        seconds = 15
        timerLabel.text = "\(seconds)"
        scoreLabel.text = "\(count)"
    }
    
    func setupButtons() {
        for button in buttons {
            button.addTarget(self, action: "buttonHit:", forControlEvents: .TouchUpInside)
        }
    }
    
    func setButtonColors() {
        let randomIndex = Int(arc4random_uniform(UInt32(buttons.count)))
        for (var i = 0; i < buttons.count; i++) {
            let button = self.buttons[i] 
            if (i == randomIndex) {
                button.backgroundColor = FlatRed()
            } else {
                let colorIndex = arc4random_uniform(UInt32(colors.count))
                button.backgroundColor = colors[Int(colorIndex)]
            }
        }
    }
    
    func randomCGFloat() -> Float {
        return Float(arc4random()) /  Float(UInt32.max)
    }
    
    func subtractTime() {
        seconds--
        timerLabel.text = "\(seconds)"
        
        if (seconds == 0)  {
            timer.invalidate()
            
            performSelector("segueToResults", withObject: nil, afterDelay: 0.5)
        }
    }
    
    func buttonHit(sender: UIButton!) {
        if (sender.backgroundColor == FlatRed()) {
            count++
        } else {
            count--
        }
        
        scoreLabel.text = "\(count)"
        
        self.setButtonColors()
    }
    
    func segueToResults() {
        performSegueWithIdentifier("toResults", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! MinigameResultsViewController
        destVC.score = Int(scoreLabel.text!)
    }
    
}
