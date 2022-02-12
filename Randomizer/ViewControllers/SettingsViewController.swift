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
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minimumValueTF.delegate = self
        maximumValueTF.delegate = self
        minimumValueTF.text = String(randomNumber.minimumValue)
        maximumValueTF.text = String(randomNumber.maximumValue)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed() {
        view.endEditing(true)
        delegate.setNewValues(for: randomNumber)
        dismiss(animated: true)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numericValue = Int(newValue) else { return }
        
        if textField == minimumValueTF {
            randomNumber.minimumValue = numericValue
        } else {
            randomNumber.maximumValue = numericValue
        }
    }
}
