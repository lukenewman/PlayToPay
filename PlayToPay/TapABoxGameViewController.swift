//
//  TapABoxGameViewController.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import UIKit
import ChameleonFramework
import HTPressableButton

class TapABoxGameViewController: UIViewController {

    @IBOutlet weak var view11: UIView!
    @IBOutlet weak var view12: UIView!
    @IBOutlet weak var view13: UIView!
    @IBOutlet weak var view21: UIView!
    @IBOutlet weak var view22: UIView!
    @IBOutlet weak var view23: UIView!
    @IBOutlet weak var view31: UIView!
    @IBOutlet weak var view32: UIView!
    @IBOutlet weak var view33: UIView!
    
    var timeLeft = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO - Add timer
        
        createButtons()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Present 3, 2, 1...
        
        // Start game
    }
    
    func createButtons() {
        createButtonInView(view11)
        createButtonInView(view12)
        createButtonInView(view13)
        createButtonInView(view21)
        createButtonInView(view22)
        createButtonInView(view23)
        createButtonInView(view31)
        createButtonInView(view32)
        createButtonInView(view33)
    }
    
    func createButtonInView(superview: UIView) {
        let button = HTPressableButton(frame: superview.frame, buttonStyle: HTPressableButtonStyle.Rounded)
        button.buttonColor = FlatWhite()
        button.shadowColor = FlatWhiteDark()
        
        superview.addSubview(button)
    }

}
