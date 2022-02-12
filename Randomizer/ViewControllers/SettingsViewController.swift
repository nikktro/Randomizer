//
//  SettingsViewController.swift
//  Randomizer
//
//  Created by Nikolay Trofimov on 11.02.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var minimumValueTF: UITextField!
    @IBOutlet var maximumValueTF: UITextField!
    
    var randomNumber: RandomNumber!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.text = String(randomNumber.minimumValue)
        maximumValueTF.text = String(randomNumber.maximumValue)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed() {
        dismiss(animated: true)
    }
    
}
