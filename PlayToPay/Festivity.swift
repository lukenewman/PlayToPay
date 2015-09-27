//
//  Festivity.swift
//  PlayToPay
//
//  Created by Luke Newman on 9/26/15.
//  Copyright © 2015 Plutonium Apps. All rights reserved.
//

import Foundation

class Festivity {
    
    var players: [Player]!
    var scoreToBeat: Int!
    var scoreToBeatHolder: Player!
    var game: Minigame!
    var currentPlayerIndex: Int!
    
    var currentPlayer: Player {
        get {
            print("PLAYERS:")
            var i = 0
            for player in players {
                print("\(i): \(player.name)")
                i++
            }
            return players[currentPlayerIndex]
        }
    }
    
    var currentPlayerIsFinalPlayer: Bool {
        get {
            return currentPlayerIndex == players.count - 1
        }
    }
    
    static let theFestivity = Festivity()
    
    init() {
        self.currentPlayerIndex = 0
        self.scoreToBeat = 0
        self.scoreToBeatHolder = nil
    }
}
