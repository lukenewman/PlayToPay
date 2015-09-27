//
//  PlayerStartViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import FlatUIKit
import HTPressableButton
import ChameleonFramework
import pop

class PlayerStartViewController: UIViewController, UITextFieldDelegate {

    let buttonTitles = ["Let's Play", "Giddyup", "Hold My Beer", "Vamos", "Do It", "Tally-Ho!", "Get it on!", "Come at me, bro"]
    
    var game: Minigame!
    
    var playButton: HTPressableButton!
    
    let festivity = Festivity.theFestivity
    let currentPlayer = Festivity.theFestivity.currentPlayer
    let currentPlayerIndex = Festivity.theFestivity.currentPlayerIndex
    
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var instructionsTextView: UITextView!
    
    @IBOutlet weak var enterNameView: UIView!
    @IBOutlet weak var enterNameLabel: UILabel!
    @IBOutlet weak var enterNameTextField: UITextField!
    
    @IBOutlet weak var scoreToBeatView: UIView!
    @IBOutlet weak var scoreToBeatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("currentPlayerIndex: \(currentPlayerIndex)")
        if currentPlayer.name != "" {
            print("currentPlayer name: \(currentPlayer.name)")
        } else {
            print("currentPlayer name: (empty)");
        }
        
        game = festivity.game
        gameTitleLabel.text = game.title
        
        enterNameView.layer.borderColor = FlatOrange().CGColor
        enterNameView.layer.borderWidth = 5
        enterNameView.layer.cornerRadius = 10
        
        enterNameTextField.layer.borderColor = FlatOrangeDark().CGColor
        enterNameTextField.layer.borderWidth = 2
        enterNameTextField.layer.cornerRadius = 5
        enterNameTextField.delegate = self
        
        drawPlayButton()
        
        if festivity.currentPlayer.name != "" {
            
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
            
            enterNameLabel.text = "Player \(festivity.currentPlayerIndex + 1),"
            
            // Disable play button
            playButton.enabled = false
        }
        
        // Print the score to beat
        print("setting score to beat to \(festivity.scoreToBeat)")
        if let holder = festivity.scoreToBeatHolder {
            scoreToBeatLabel.text = "\(festivity.scoreToBeat) (\(holder))"
        }
        scoreToBeatLabel.text = "\(festivity.scoreToBeat)"
    }
    
    // MARK: Entering a name
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textFieldDidEndEditing(textField)
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("textFieldDidEndEditing")
        if textField.text != "" {
            textField.resignFirstResponder()
            
            // Save player name
            print("saving player name: \(textField.text!)")
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
