//
//  PlayerStartViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import HTPressableButton
import ChameleonFramework
import pop

class PlayerStartViewController: UIViewController, UITextFieldDelegate {

    let buttonTitles = ["Let's Play", "Giddyup", "Hold My Beer", "Vamos", "Do It", "Tally-Ho!", "Get it on!", "Come at me, bro"]
    
    var game: Minigame!
    
    var playButton: HTPressableButton!
    
    let currentPlayer = Festivity.theFestivity.currentPlayer
    let currentPlayerIndex = Festivity.theFestivity.currentPlayerIndex
    
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameIconBackgroundView: UIView!
    @IBOutlet weak var gameIconImageView: UIImageView!
    @IBOutlet weak var instructionsTextView: UITextView!
    
    @IBOutlet weak var enterNameView: UIView!
    @IBOutlet weak var enterNameLabel: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    
    @IBOutlet weak var scoreToBeatView: UIView!
    @IBOutlet weak var scoreToBeatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Festivity.theFestivity.game
        gameTitleLabel.text = game.title
        gameTitleLabel.textColor = game.themeColor
        gameIconBackgroundView.backgroundColor = game.themeColor
        gameIconBackgroundView.layer.cornerRadius = 10
        gameIconImageView.image = game.icon
        
        instructionsTextView.text = game.instructions
        instructionsTextView.font = UIFont(name: "Aleo-Regular", size: 17.0)
        
        enterNameView.layer.borderColor = FlatOrange().CGColor
        enterNameView.layer.borderWidth = 5
        enterNameView.layer.cornerRadius = 10
        
        let layer = CALayer()
        layer.frame = CGRectMake(0, enterNameTextField.bounds.size.height - 2.0, enterNameTextField.bounds.size.width, 2.0)
        layer.backgroundColor = UIColor(white: 0.8, alpha: 1.0).CGColor
        enterNameTextField.layer.addSublayer(layer)
        enterNameTextField.delegate = self
        
        drawPlayButton()
        
        if Festivity.theFestivity.currentPlayer.name != "" {
            
            // Hide enterNameView
            enterNameView.hidden = true
            
            // Show scoreToBeatView
            scoreToBeatView.snp_makeConstraints(closure: { (make) -> Void in
                make.centerX.equalTo(enterNameView)
                make.centerY.equalTo(enterNameView)
            })
            
        } else {
            
            // Move scoreToBeatView offscreen
            scoreToBeatView.snp_makeConstraints(closure: { (make) -> Void in
                make.centerY.equalTo(enterNameView)
                make.left.equalTo(self.view.snp_right)
            })
            
            enterNameLabel.text = "Player \(Festivity.theFestivity.currentPlayerIndex + 1),"
            
            // Disable play button
            playButton.enabled = false
        }
        
        // Display the score to beat
        if let holder = Festivity.theFestivity.scoreToBeatHolder {
            scoreToBeatLabel.text = "\(Festivity.theFestivity.scoreToBeat) (\(holder))"
        }
        scoreToBeatLabel.text = "\(Festivity.theFestivity.scoreToBeat)"
    }
    
    // MARK: Entering a name
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textFieldDidEndEditing(textField)
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.text != "" {
            textField.resignFirstResponder()
            
            // Save player name
            Festivity.theFestivity.currentPlayer.name = textField.text!
            
            let oldX = enterNameView.frame.midX
            
            // Move enterNameView offscreen left
            let removeLeft = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
            removeLeft.toValue = -500
            removeLeft.springBounciness = 10
            removeLeft.springSpeed = 10
            enterNameView.layer.pop_addAnimation(removeLeft, forKey: "removeLeft")

            // Move scoreToBeat view to middle
            let enterFromRight = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
            enterFromRight.toValue = oldX
            enterFromRight.springBounciness = 10
            enterFromRight.springSpeed = 10
            scoreToBeatView.layer.pop_addAnimation(enterFromRight, forKey: "enterFromRight")
            
            enterNameView.updateConstraints()
            scoreToBeatView.updateConstraints()
            
            playButton.enabled = true
        }
    }
    
    // MARK: Play the game

    func drawPlayButton() {
        let buttonFrame = CGRectMake(0, 0, 250, 50)
        
        playButton = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Rounded)
        
        let randomTitleIndex = Int(arc4random_uniform(UInt32(buttonTitles.count)))
        let title = buttonTitles[randomTitleIndex]
        
        playButton.setTitle(title, forState: UIControlState.Normal)
        playButton.buttonColor = FlatYellow()
        playButton.shadowColor = FlatYellowDark()
        
        playButton.addTarget(self, action: "playGame", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(playButton)
        
        playButton.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-50)
            make.centerX.equalTo(self.view)
        }
    }
    
    func playGame() {
        performSegueWithIdentifier(game.segueIdentifier, sender: self)
    }
    
}
