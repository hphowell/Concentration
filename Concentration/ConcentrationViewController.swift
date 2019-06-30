//
//  ViewController.swift
//  Concentration
//
//  Created by Hayden Howell on 3/26/19.
//  Copyright © 2019 Hayden Howell. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController
{
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        randomIndex = Int(arc4random_uniform(uint(themes.count)))
        emojiChoices = themes[randomIndex]
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        flipCountLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Score: \(game.score)"
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var halloweenTheme = ["👻", "🎃", "🦇", "😱", "🙀", "😈", "🍭", "🍬", "🍎"]
    var animalTheme = ["🐼"]
    var sportsTheme = ["🏀"]
    var facesTheme = ["😀"]
    var flagsTheme = ["🇺🇸"]
    var foodTheme = ["🍕"]
    lazy var themes = [halloweenTheme, animalTheme, sportsTheme, facesTheme, flagsTheme, foodTheme]
    
    lazy var randomIndex = Int(arc4random_uniform(uint(themes.count)))
    lazy var emojiChoices = themes[randomIndex]
    
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(uint(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

