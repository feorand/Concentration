//
//  ViewController.swift
//  Concentration
//
//  Created by Pavel Prokofyev on 04.12.2017.
//  Copyright © 2017 Pavel Prokofyev. All rights reserved.
//

import UIKit

class GameViewController: UIViewController
{
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var flipCardButtons: [UIButton]!
    @IBOutlet weak var newGameButton: UIButton!
    
    typealias Theme = (images:[String], backgroundColor: UIColor, foregroundColor: UIColor)
    
    let themes:[String: Theme] = [
        "halloween": (["👻", "🎃", "💀", "🦇", "🧙‍♀️", "🍎"], #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)),
        "christmas": (["🌲", "☃️", "🍭", "🎅", "❄️", "👶"], #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),
        "faces": (["😀", "😂", "😘", "😎", "🤪", "😱"], #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    ]
    
    var currentTheme: Theme!
    
    var game:Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
        UpdateGameView(flips: 0, score: 0)
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        guard let index = flipCardButtons.index(of: sender) else { return }
        
        game.flipCard(number: index)
        
        if game.isOver {
            startNewGame()
        }
        
        UpdateGameView(flips: game.flipCount, score: game.score)
    }
    
    @IBAction func touchNewGameButton(_ sender: UIButton) {
        startNewGame()
        UpdateGameView(flips: 0, score: 0)
    }
    
    private func UpdateGameView(flips:Int, score:Int) {
        for i in 0..<flipCardButtons.count {
            if game.cards[i].isFlipped {
                flipCardButtons[i].setTitle(currentTheme.images[game.cards[i].id], for: .normal)
                flipCardButtons[i].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                flipCardButtons[i].setTitle("", for: .normal)
                flipCardButtons[i].backgroundColor = currentTheme.foregroundColor
            }
            
            if !game.cards[i].isEnabled {
                flipCardButtons[i].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
                flipCardButtons[i].setTitle("", for: .normal)
            }
            
            flipCardButtons[i].isEnabled = game.cards[i].isEnabled
        }
        
        flipCountLabel.text = "Flips:\(flips)"
        scoreLabel.text = "Score:\(score)"
    }
    
    private func startNewGame() {
        game = Game(numberOfPairs: 6)
        setTheme()
    }
    
    private func setTheme() {
        view.backgroundColor = currentTheme.backgroundColor
                
        flipCountLabel.textColor = currentTheme.foregroundColor
        scoreLabel.textColor = currentTheme.foregroundColor
        newGameButton.setTitleColor(currentTheme.foregroundColor, for: .normal)
    }
}

