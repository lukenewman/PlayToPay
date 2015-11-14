//
//  BustIt.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/27/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import Foundation
import ChameleonFramework

class BustIt : Minigame {
    override init() {
        super.init()
        
        self.title = "Bust-It"
        self.instructions = "Tap once when you see a color change. Faster reaction, more points."
        self.segueIdentifier = "bustIt"
        self.themeColor = FlatGreen()
        self.icon = UIImage(named: "rightstopwatch_360")
    }
}