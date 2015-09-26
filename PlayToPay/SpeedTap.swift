//
//  SpeedTap.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import Foundation

class SpeedTap : Minigame {
    override init() {
        super.init()
        
        self.title = "Speed Tap"
        self.instructions = "Tap as many times as you can in 15 seconds."
        self.segueIdentifier = "speedTap"
    }
}
