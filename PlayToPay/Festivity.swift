//
//  Festivity.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import Foundation

class Festivity {
    
    enum GameMode {
        case SingleRound
        case Elimination
    }
    
    var players: [Player]!
    var scoreToBeat: Int!
    var gameMode: GameMode!
    
    static let theFestivity = Festivity()
}
