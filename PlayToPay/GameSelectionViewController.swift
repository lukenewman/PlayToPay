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

class GameSelectionViewController: UIViewController, POPAnimationDelegate {
    
    var animationCompletionCount = 10
    let rotateDown = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
    let rotateUp = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
    
    let buttonTitles = ["Neato!", "Groovy", "Aight", "Cool Beans", "Dope", "Rad"]
    let games = [SpeedTap(), SpeedTap(), SpeedTap()]
    
    var selectedGame: Minigame!

    var continueButton: HTPressableButton!
    
    @IBOutlet weak var mysteryTileView: UIView!
    @IBOutlet weak var questionMarkLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mysteryTileView.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = FlatWhite()
        gameTitleLabel.hidden = true
        
        drawContinueButton()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        startTheSelection()
        showContinueButton()
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

        let animation = CABasicAnimation(keyPath:"transform.rotation.y")
        animation.toValue = M_PI
        animation.speed = 3
        animation.repeatCount = 10
        mysteryTileView.layer.addAnimation(animation, forKey: "rotate")
        
        questionMarkLabel.hidden = true
        gameTitleLabel.text = selectedGame.title
        gameTitleLabel.hidden = false
        
        let animation1 = CABasicAnimation(keyPath:"transform.rotation.y")
        animation1.toValue = M_PI
        animation1.speed = 3
        animation1.repeatCount = 4
        mysteryTileView.layer.addAnimation(animation1, forKey: "rotate")
    }
    
    func goToTheGame() {
        performSegueWithIdentifier("toPlayerStart", sender: self)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! PlayerStartViewController
        destVC.game = selectedGame
    }

}
