//
//  ViewController.swift
//  Tipsy
//
//  Created by Diganta Som on 25/09/22.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    
    var numberOfPeople: Int = 2
    var finalResult: String = "0.0"
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        splitStepper.value = 2.0
        splitNumberLabel.text = String(format: "%.0f", splitStepper.value)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        calculatorBrain.calculateTip(buttonTitle: sender.currentTitle!)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill: String = billTextField.text!
        
        if bill != "" {
            let billTotal = Double(bill)!
            finalResult = calculatorBrain.calculateSplit(billTotal, numberOfPeople)
            
            performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let resultsVC = segue.destination as! ResultsViewController
            
            resultsVC.result = finalResult
            resultsVC.tip = calculatorBrain.tip * 100
            resultsVC.split = numberOfPeople
        }
    }
}
