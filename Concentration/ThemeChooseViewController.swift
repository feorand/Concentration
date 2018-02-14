//
//  ThemeChooseViewController.swift
//  Concentration
//
//  Created by Pavel Prokofyev on 14.02.2018.
//  Copyright © 2018 Pavel Prokofyev. All rights reserved.
//

import UIKit

class ThemeChooseViewController: UIViewController {
    
    var lastSeguedVC:GameViewController?
    
    @IBAction func themeButtonPressed(sender: UIButton) {
        if let gameController = lastSeguedVC {
            let name = nameOf(sender: sender)
            gameController.currentTheme = themes[name]!
            navigationController?.pushViewController(gameController, animated: true)
        } else {
            performSegue(withIdentifier: "Chose Theme", sender: sender)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case .some("Chose Theme"):
            let name = nameOf(sender: sender)
            let controller = segue.destination as! GameViewController
            controller.currentTheme = themes[name]!
            lastSeguedVC = controller
        default: break
        }
    }
    
    private func nameOf(sender: Any?) -> String {
        let senderButton = sender! as! UIButton
        return senderButton.title(for: .normal)!
    }
}
