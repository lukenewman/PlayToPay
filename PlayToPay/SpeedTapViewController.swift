//
//  SpeedTapViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import HTPressableButton
import ChameleonFramework

class SpeedTapViewController: UIViewController {

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
        
        button.setTitle("🎊", forState: UIControlState.Normal)
        
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
    
    func subtractTime() {
        seconds--
        timerLabel.text = "\(seconds)"
        
        if(seconds == 0)  {
            timer.invalidate()
            let alert = UIAlertController(title: "Time is up!", message: "You scored \(count) points", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {action in self.setupGame()}))
            presentViewController(alert, animated: true, completion:nil)
        }
    }
    
    func buttonPressed()  {
        count++
        scoreLabel.text = "\(count)"
    }

}
