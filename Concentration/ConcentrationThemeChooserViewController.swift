//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Hayden Howell on 6/29/19.
//  Copyright © 2019 Hayden Howell. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    // MARK: - Navigation
    let themes = ["Halloween": ["👻", "🎃", "🦇", "😱", "🙀", "😈", "🍭", "🍬", "🍎"], "Animals": ["🐼"], "Sports": ["🏀"], "Faces": ["😀"], "Flags": ["🇺🇸"], "Food": ["🍕"]]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.emojiChoices = theme
                }
            }
        }
        
    }


}
