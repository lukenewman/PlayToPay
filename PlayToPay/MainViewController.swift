//
//  MainViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import ChameleonFramework
import HTPressableButton
import SnapKit
import L360Confetti

class MainViewController: UIViewController, L360ConfettiAreaDelegate {
    
    var numberOfPlayers = 4
    let minNumberOfPlayers = 2
    let maxNumberOfPlayers = 8
    
    var commenceButton: HTPressableButton!
    var plusButton: HTPressableButton!
    var minusButton: HTPressableButton!
    
    var confettiArea: L360ConfettiArea!
    
    @IBOutlet weak var numPlayersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = FlatWhite()

        confettiArea = L360ConfettiArea(frame: self.view.frame)
        confettiArea.delegate = self
        self.view.addSubview(confettiArea)
        
        drawCommenceButton()
        drawPlusButton()
        drawMinusButton()
    }
    
    func drawCommenceButton() {
        let buttonFrame = CGRectMake(0, 0, 250, 50)
        
        commenceButton = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Rounded)
        commenceButton.setTitle("Commence Festivities", forState: UIControlState.Normal)
        commenceButton.buttonColor = FlatYellow()
        commenceButton.shadowColor = FlatYellowDark()

        commenceButton.addTarget(self, action: "commenceFestivities", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(commenceButton)
        
        commenceButton.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-50)
            make.centerX.equalTo(self.view)
        }
    }
    
    func drawPlusButton() {
        let buttonFrame = CGRectMake(0, 0, 70, 70)
        
        plusButton = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Circular)
        plusButton.buttonColor = FlatGreen()
        plusButton.shadowColor = FlatGreenDark()
        plusButton.disabledButtonColor = FlatGray()
        
        plusButton.setTitle("MORE", forState: UIControlState.Normal)
        
        plusButton.addTarget(self, action: "addPlayer", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(plusButton)
        
        plusButton.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.view)
            make.right.equalTo(self.view).offset(-30)
        }
    }
    
    func drawMinusButton() {
        let buttonFrame = CGRectMake(0, 0, 70, 70)
        
        minusButton = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Circular)
        minusButton.buttonColor = FlatRed()
        minusButton.shadowColor = FlatRedDark()
        minusButton.disabledButtonColor = FlatGray()
        minusButton.setTitle("LESS", forState: UIControlState.Normal)
        
        minusButton.addTarget(self, action: "subPlayer", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(minusButton)
        
        minusButton.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.view)
            make.left.equalTo(self.view).offset(30)
        }
    }
    
    func commenceFestivities() {
        Festivity.theFestivity.players = []
        for _ in 1...Int(numPlayersLabel.text!)! {
            Festivity.theFestivity.players.append(Player())
        }
        confettiArea.burstAt(self.view.center, confettiWidth: 10, numberOfConfetti: 50)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            self.performSegueWithIdentifier("toGameSelection", sender: self)
        }
    }
    
    func addPlayer() {
        if numberOfPlayers == minNumberOfPlayers {
            minusButton.enabled = true
        }
        
        numberOfPlayers++
        if numberOfPlayers >= maxNumberOfPlayers {
            numberOfPlayers = maxNumberOfPlayers
            plusButton.enabled = false
        }
        
        self.numPlayersLabel.text = "\(numberOfPlayers)"
    }
    
    func subPlayer() {
        if numberOfPlayers == maxNumberOfPlayers {
            plusButton.enabled = true
        }
        
        numberOfPlayers--
        if numberOfPlayers <= minNumberOfPlayers {
            numberOfPlayers = minNumberOfPlayers
            minusButton.enabled = false
        }
        
        self.numPlayersLabel.text = "\(numberOfPlayers)"
    }
    
    func colorsForConfettiArea(confettiArea: L360ConfettiArea!) -> [AnyObject]! {
        return [FlatMint(), FlatWatermelon(), FlatSkyBlue(), FlatYellow()]
    }
    
}

