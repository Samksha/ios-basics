//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Samksha Bhardwaj on 14/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var controller: ConversionController = ConversionController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
        updateCelsiusLabel()
    }
    
    func updateCelsiusLabel() {
        celsiusLabel.text = controller.updateCelsiusValue()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        controller.updateFahrenheitValue(textField: textField)
        updateCelsiusLabel()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return controller.verifyTextField(textField: textField, replacementString: string)
    }
}

