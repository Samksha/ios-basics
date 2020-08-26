//
//  ConversionController.swift
//  WorldTrotter
//
//  Created by Samksha Bhardwaj on 26/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import Foundation
import UIKit

class ConversionController {
    
    var store: TemperatureStore = TemperatureStore()
    
    //Update celsius value and return to label
    func updateCelsiusValue() -> String {
        var celsiusText = "???"
        if let celsiusValue = store.celsiusValue {
            celsiusText = numberFormatter.string(from: NSNumber(value: celsiusValue.value)) ?? "???"
        }
        return celsiusText
    }
    
    func updateFahrenheitValue(textField: UITextField) {
        if let text = textField.text, let number = numberFormatter.number(from: text){
            store.fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        }
        else {
            store.fahrenheitValue = nil
        }
    }
    
    //Disallow multiple decimals
    func verifyTextField(textField: UITextField, replacementString: String) -> Bool {
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeperator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeperator = replacementString.range(of: decimalSeparator)

        if existingTextHasDecimalSeperator != nil,replacementTextHasDecimalSeperator != nil {
            return false
        }
        else {
            return true
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
}
