//
//  ControlPanel.swift
//  PlayToPay
//
//  Created by Luke Newman on 10/27/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import Foundation
import ChameleonFramework

class ControlPanel : Minigame {
    override init() {
        super.init()
        
        self.title = "Control Panel"
        self.instructions = "Find and tap the red button as many times as possible."
        self.segueIdentifier = "controlPanel"
        self.themeColor = FlatBlue()
        self.icon = UIImage(named: "control_panel_icon")
    }
}
