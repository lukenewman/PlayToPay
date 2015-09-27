//
//  SwitchUp.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/27/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import Foundation
import ChameleonFramework

class SwitchUp : Minigame {
    override init() {
        super.init()
        
        self.title = "Switch Up"
        self.instructions = "Tap a colored section for +1 points and a gray one for -1 points -- your choice."
        self.segueIdentifier = "switchUp"
        self.themeColor = FlatOrange()
        self.icon = UIImage(named: "arrow_360")
    }
}
