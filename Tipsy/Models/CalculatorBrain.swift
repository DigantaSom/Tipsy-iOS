//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Diganta Som on 25/09/22.
//

import Foundation

struct CalculatorBrain {
    var tip: Double = 0.10
    
    mutating func calculateTip(buttonTitle: String) {
        let buttonTitleWithoutPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleWithoutPercentSign)!
        tip = buttonTitleAsNumber / 100
    }
    
    func calculateSplit(_ billTotal: Double, _ numberOfPeople: Int) -> String {
        let result = billTotal * (1 + tip) / Double(numberOfPeople)
        return String(format: "%0.2f", result)
    }
}
