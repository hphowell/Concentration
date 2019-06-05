//
//  Concentration.swift
//  Concentration
//
//  Created by Hayden Howell on 3/26/19.
//  Copyright © 2019 Hayden Howell. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    var flipCount = 0
    
    var score = 0
    
    func chooseCard(at index: Int) {

        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else if cards[matchIndex].hasFlipped, cards[index].hasFlipped{
                    score -= 2
                } else if cards[matchIndex].hasFlipped || cards[index].hasFlipped{
                    score -= 1
                }
                cards[index].isFaceUp = true
                cards[index].hasFlipped = true
                cards[matchIndex].hasFlipped = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
}
