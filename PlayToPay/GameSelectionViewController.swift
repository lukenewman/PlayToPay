//
//  GameSelectionViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 11/6/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit

class GameSelectionViewController: UIViewController {
    @IBOutlet weak var rapidFireView: UIView!
    @IBOutlet weak var bustItView: UIView!
    @IBOutlet weak var controlPanelView: UIView!
    @IBOutlet weak var switchUpView: UIView!
    @IBOutlet weak var randomButton: UIButton!
    
    override func viewDidLoad() {
        rapidFireView.layer.cornerRadius = 5
        bustItView.layer.cornerRadius = 5
        controlPanelView.layer.cornerRadius = 5
        switchUpView.layer.cornerRadius = 5
        randomButton.layer.cornerRadius = 5
    }
    
    @IBAction func rapidFireSelected(sender: AnyObject) {
        Festivity.theFestivity.game = RapidFire()
        self.performSegueWithIdentifier("toPlayerStart", sender: self)
    }

    @IBAction func bustItSelected(sender: AnyObject) {
        Festivity.theFestivity.game = BustIt()
        self.performSegueWithIdentifier("toPlayerStart", sender: self)
    }
    
    @IBAction func controlPanelSelected(sender: AnyObject) {
        Festivity.theFestivity.game = ControlPanel()
        self.performSegueWithIdentifier("toPlayerStart", sender: self)
    }
    
    @IBAction func switchUpSelected(sender: AnyObject) {
        Festivity.theFestivity.game = SwitchUp()
        self.performSegueWithIdentifier("toPlayerStart", sender: self)
    }

    @IBAction func toRandomSelection(sender: AnyObject) {
        self.performSegueWithIdentifier("toRandomGameSelection", sender: self)
    }
    
}
