//
//  GameSelectionViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import HTPressableButton
import ChameleonFramework
import SnapKit
import pop

class RandomGameSelectionViewController: UIViewController, POPAnimationDelegate {
    
    let buttonTitles = ["Neato!", "Groovy", "Aight", "Cool Beans", "Dope", "Rad"]
    let games = [RapidFire(), BustIt(), SwitchUp(), ControlPanel()]
    
    var selectedGame: Minigame!

    var continueButton: HTPressableButton!
    
    @IBOutlet weak var mysteryTileView: UIView!
    @IBOutlet weak var questionMarkLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameIconImageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        mysteryTileView.layer.cornerRadius = 10
        
        self.view.backgroundColor = FlatWhite()
        gameTitleLabel.hidden = true
        gameIconImageView.hidden = true
        
        drawContinueButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            self.startTheSelection()
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
                self.showContinueButton()
            }
        }
    }
    
    func drawContinueButton() {
        let buttonFrame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height + 50, 250, 50)
        
        continueButton = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Rounded)
        
        let randomTitleIndex = Int(arc4random_uniform(UInt32(buttonTitles.count)))
        let title = buttonTitles[randomTitleIndex]
        
        continueButton.setTitle(title, forState: UIControlState.Normal)
        continueButton.buttonColor = FlatYellow()
        continueButton.shadowColor = FlatYellowDark()
        
        continueButton.addTarget(self, action: "goToTheGame", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(continueButton)
        
        continueButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_bottom)
            make.centerX.equalTo(self.view)
        }
    }
    
    func showContinueButton() {
        let anim = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        anim.toValue = UIScreen.mainScreen().bounds.size.height - 100
        anim.springBounciness = 10
        anim.springSpeed = 10
        continueButton.pop_addAnimation(anim, forKey: "slideIn")
        
        continueButton.snp_remakeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-70)
            make.centerX.equalTo(self.view)
        }
    }
    
    func startTheSelection() {
        let randomGameIndex = Int(arc4random_uniform(UInt32(games.count)))
        selectedGame = games[randomGameIndex]
        Festivity.theFestivity.game = selectedGame
        
        let spin = CABasicAnimation(keyPath:"transform.rotation.y")
        spin.toValue = M_PI
        spin.speed = 3
        spin.repeatCount = 6
        mysteryTileView.layer.addAnimation(spin, forKey: "spin")
        
        questionMarkLabel.hidden = true
        gameTitleLabel.text = selectedGame.title
        gameIconImageView.image = selectedGame.icon
        gameTitleLabel.hidden = false
        gameIconImageView.hidden = false
        mysteryTileView.backgroundColor = selectedGame.themeColor
        
        let reveal = CABasicAnimation(keyPath:"transform.rotation.y")
        reveal.toValue = M_PI
        reveal.speed = 3
        reveal.repeatCount = 4
        mysteryTileView.layer.addAnimation(reveal, forKey: "reveal")
    }
    
    func goToTheGame() {
        performSegueWithIdentifier("toPlayerStart", sender: self)
    }

}
