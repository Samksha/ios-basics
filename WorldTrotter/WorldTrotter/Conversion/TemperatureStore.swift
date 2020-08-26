//
//  TemperatureStore.swift
//  WorldTrotter
//
//  Created by Samksha Bhardwaj on 26/08/20.
//  Copyright © 2020 Samksha Bhardwaj. All rights reserved.
//

import Foundation

//Model
class TemperatureStore {
    
    var fahrenheitValue: Measurement<UnitTemperature>?
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        }
        else {
            return nil
        }
    }
}
