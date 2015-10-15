//
//  EndResultsViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/27/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import SnapKit
import ChameleonFramework
import HTPressableButton
import pop
import L360Confetti
import AVFoundation
import Venmo_iOS_SDK

class EndResultsViewController: UIViewController, L360ConfettiAreaDelegate {

    let festivity = Festivity.theFestivity
    
    var confettiArea: L360ConfettiArea!
    
    var playAgainButton: HTPressableButton!
    var venmoButton: HTPressableButton!
    
    @IBOutlet weak var loserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confettiArea = L360ConfettiArea(frame: self.view.frame)
        confettiArea.delegate = self
        self.view.addSubview(confettiArea)

        print("loserLabel: \(loserLabel)")
        loserLabel.text = festivity.scoreToBeatHolder.name
        
        loserLabel.snp_makeConstraints(closure: { (make) -> Void in
            make.centerY.equalTo(self.view)
            make.left.equalTo(self.view.snp_right)
        })
        
        drawPlayAgainButton()
        drawVenmoButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            self.showLoser()
            
            self.playHorn()
            
            self.view.bringSubviewToFront(self.confettiArea)
            
            // CONFETTI
            self.confettiArea.burstAt(CGPointMake(self.view.bounds.size.width / 4, 30), confettiWidth: 5, numberOfConfetti: 25)
            self.confettiArea.burstAt(CGPointMake(self.view.bounds.size.width / 2, 30), confettiWidth: 5, numberOfConfetti: 25)
            self.confettiArea.burstAt(CGPointMake(3 * (self.view.bounds.size.width / 4), 30), confettiWidth: 5, numberOfConfetti: 25)
            
            self.view.bringSubviewToFront(self.venmoButton)
            self.view.bringSubviewToFront(self.playAgainButton)
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            self.showPlayAgainButton()
            self.showVenmoButton()
        }
    }
    
    var avPlayer: AVAudioPlayer!
    
    func playHorn() {
        do {
            try avPlayer = AVAudioPlayer(contentsOfURL: NSURL (fileURLWithPath: NSBundle.mainBundle().pathForResource("menu_horn", ofType: "wav")!), fileTypeHint:nil)
            avPlayer.prepareToPlay()
            avPlayer.play()
        } catch {
            //Handle the error
        }
    }
    
    func showPlayAgainButton() {
        let anim = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        anim.toValue = UIScreen.mainScreen().bounds.size.height - 100
        anim.springBounciness = 10
        anim.springSpeed = 10
        playAgainButton.pop_addAnimation(anim, forKey: "slideIn")
        
        playAgainButton.snp_remakeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-75)
            make.centerX.equalTo(self.view).offset(-90)
        }
    }
    
    func showVenmoButton() {
        let anim = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        anim.toValue = UIScreen.mainScreen().bounds.size.height - 100
        anim.springBounciness = 10
        anim.springSpeed = 10
        venmoButton.pop_addAnimation(anim, forKey: "slideIn")
        
        venmoButton.snp_remakeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-75)
            make.centerX.equalTo(self.view).offset(90)
        }
    }
    
    func drawPlayAgainButton() {
        let buttonFrame = CGRectMake(0, 0, 150, 50)
        
        playAgainButton = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Rounded)
        
        playAgainButton.setTitle("Play Again?", forState: UIControlState.Normal)
        playAgainButton.buttonColor = FlatYellow()
        playAgainButton.shadowColor = FlatYellowDark()
        
        playAgainButton.addTarget(self, action: "backToMain", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(playAgainButton)
        
        playAgainButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_bottom)
            make.right.equalTo(self.view.snp_centerX).offset(-70)
        }
    }
    
    func drawVenmoButton() {
        let buttonFrame = CGRectMake(0, 0, 150, 50)
        
        venmoButton = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Rounded)
        
        venmoButton.setTitle("Pay With Venmo", forState: UIControlState.Normal)
        
        venmoButton.buttonColor = UIColor(red: 61/255, green: 149/255, blue: 206/255, alpha: 1)
        venmoButton.shadowColor = UIColor(red: 10/255, green: 98/255, blue: 155/255, alpha: 1)
        
        venmoButton.addTarget(self, action: "payWithVenmo", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(venmoButton)
        
        venmoButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_bottom)
            make.left.equalTo(self.view.snp_centerX).offset(70)
        }
    }
    
    func showLoser() {
        let enterFromRight = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        enterFromRight.toValue = self.view.bounds.midX
        enterFromRight.springBounciness = 10
        enterFromRight.springSpeed = 10
        loserLabel.layer.pop_addAnimation(enterFromRight, forKey: "enterFromRight")
        
        loserLabel.snp_remakeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
        }
    }
    
    func colorsForConfettiArea(confettiArea: L360ConfettiArea!) -> [AnyObject]! {
        return [FlatMint(), FlatWatermelon(), FlatSkyBlue(), FlatYellow()]
    }

    // MARK: - Navigation
    
    func backToMain() {
        performSegueWithIdentifier("toMain", sender: self)
    }
    
    func payWithVenmo() {
        Venmo.sharedInstance().requestPermissions([VENPermissionMakePayments, VENPermissionAccessProfile]) { (success, error) -> Void in
            if success {
                
            } else {
                
            }
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
