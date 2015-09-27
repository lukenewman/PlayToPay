//
//  SpeedTap.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import Foundation
import ChameleonFramework

class RapidFire : Minigame {
    override init() {
        super.init()
        
        self.title = "Rapid Fire"
        self.instructions = "Tap as many times as humanly possible in 15 seconds. Now is the time to assert your tapping dominance."
        self.segueIdentifier = "rapidFire"
        self.themeColor = FlatRed()
        self.icon = UIImage(named: "finger_360")
    }
}
