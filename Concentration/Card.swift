//
//  Card.swift
//  Concentration
//
//  Created by Hayden Howell on 3/26/19.
//  Copyright © 2019 Hayden Howell. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    var hasFlipped = false
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
