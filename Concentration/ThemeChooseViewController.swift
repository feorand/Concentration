//
//  ThemeChooseViewController.swift
//  Concentration
//
//  Created by Pavel Prokofyev on 14.02.2018.
//  Copyright © 2018 Pavel Prokofyev. All rights reserved.
//

import UIKit

class ThemeChooseViewController: UIViewController {
    @IBAction func themeButtonPressed(sender: UIButton) {
        performSegue(withIdentifier: "Chose Theme", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case .some("Chose Theme"):
            let senderButton = sender! as! UIButton
            let name = senderButton.title(for: .normal)!
            
            let controller = segue.destination as! GameViewController
            controller.currentTheme = themes[name]!
        default: break
        }
    }
}
