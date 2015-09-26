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

class PlayerStartViewController: UIViewController, UITextFieldDelegate {

    let buttonTitles = ["Let's Play", "Giddyup", "Hold My Beer", "Vamos", "Do It"]
    
    var game: Minigame!
    
    var playButton: HTPressableButton!
    
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var enterNameView: UIView!
    @IBOutlet weak var enterNameLabel: UIView!
    @IBOutlet weak var enterNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTitleLabel.text = game.title
        
        enterNameView.layer.borderColor = FlatOrange().CGColor
        enterNameView.layer.borderWidth = 5
        enterNameView.layer.cornerRadius = 10
        
        enterNameTextField.layer.borderColor = FlatOrangeDark().CGColor
        enterNameTextField.layer.borderWidth = 2
        enterNameTextField.layer.cornerRadius = 5
        enterNameTextField.delegate = self
        
        drawPlayButton()
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textFieldDidEndEditing(textField)
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // save player name
        // animate flip
        let animation = CABasicAnimation(keyPath:"transform.rotation.y")
        animation.toValue = M_PI
        animation.speed = 3
        enterNameView.layer.addAnimation(animation, forKey: "rotate")
    }

    func drawPlayButton() {
        let buttonFrame = CGRectMake(0, 0, 250, 50)
        
        let playButton = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Rounded)
        
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
        print("play game")
        performSegueWithIdentifier(game.segueIdentifier, sender: self)
    }
    
}
