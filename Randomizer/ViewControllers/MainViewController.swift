//
//  MainViewController.swift
//  Randomizer
//
//  Created by Nikolay Trofimov on 09.02.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {

    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomValueLabel: UILabel!
    
    @IBOutlet var getResultButton: UIButton!
    
    var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getResultButton.layer.cornerRadius = 20
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
    }
    
    @IBAction func getRandomNumberButtonPressed() {
        randomValueLabel.text = String(randomNumber.getRandom)
    }

}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber) {
        minimumValueLabel.text = String(randomNumber.minimumValue)
        maximumValueLabel.text = String(randomNumber.maximumValue)
        self.randomNumber = randomNumber
    }
}
