//
//  MinigameResultsViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import HTPressableButton
import ChameleonFramework
import SnapKit

class MinigameResultsViewController: UIViewController {

    let badButtonTitles = ["I hate this game.", "This game sucks.", "I let them win.", "Rigged!", "Damn."]
    let goodButtonTitles = ["Suckas!", "#weblessed", "Heck Yeah", "Not surprised...", "Next!"]
    
    var player = Festivity.theFestivity.currentPlayer
    var score: Int!
    
    @IBOutlet weak var playerScoredALabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var betterThanLabel: UILabel!
    @IBOutlet weak var resultLabel1: UILabel!
    @IBOutlet weak var resultLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerScoredALabel.text = "\(player.name) scored a"
        scoreLabel.text = "\(score)"
        
        if Festivity.theFestivity.scoreToBeat == 0 {
            betterThanLabel.text = "(better than \(Festivity.theFestivity.scoreToBeat))"
            
            resultLabel1.text = "which means \(player.name)"
            resultLabel2.text = "is SAFE!"
            
            Festivity.theFestivity.scoreToBeat = score
            Festivity.theFestivity.scoreToBeatHolder = player
            
            let index = Int(arc4random_uniform(UInt32(goodButtonTitles.count)))
            drawButton(goodButtonTitles[index])
        } else if score > Festivity.theFestivity.scoreToBeat {
            betterThanLabel.text = "(better than \(Festivity.theFestivity.scoreToBeat))"
            
            resultLabel1.text = "which means \(player.name)"
            resultLabel2.text = "is SAFE!"
            
            let index = Int(arc4random_uniform(UInt32(goodButtonTitles.count)))
            drawButton(goodButtonTitles[index])
        } else {
            betterThanLabel.text = "(worse than \(Festivity.theFestivity.scoreToBeat))"
            Festivity.theFestivity.scoreToBeat = score
            Festivity.theFestivity.scoreToBeatHolder = player
            
            resultLabel1.text = "which makes \(player.name)"
            resultLabel2.text = "the new LOSER!"
            
            let index = Int(arc4random_uniform(UInt32(badButtonTitles.count)))
            drawButton(badButtonTitles[index])
        }
    }
    
    func drawButton(title: String!) {
        let buttonFrame = CGRectMake(0, 0, 250, 50)
        
        let button = HTPressableButton(frame: buttonFrame, buttonStyle: HTPressableButtonStyle.Rounded)
        button.setTitle(title, forState: UIControlState.Normal)
        button.buttonColor = FlatYellow()
        button.shadowColor = FlatYellowDark()
        
        if Festivity.theFestivity.currentPlayerIsFinalPlayer {
            button.addTarget(self, action: "showEndResults", forControlEvents: UIControlEvents.TouchUpInside)
        } else {
            Festivity.theFestivity.currentPlayerIndex! += 1
            button.addTarget(self, action: "showPlayerStart", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        self.view.addSubview(button)
        
        button.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).offset(-50)
            make.centerX.equalTo(self.view)
        }
    }
    
    func showEndResults() {
        performSegueWithIdentifier("toEndResults", sender: self)
    }
    
    func showPlayerStart() {
        performSegueWithIdentifier("toPlayerStart", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
