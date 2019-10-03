//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


enum Currency {
    case cad
    case mxn
}




class ViewController: UIViewController {
    
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    var currency: Currency = .cad
    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let userInputString = fromCurrencyTextField.text else {return}
        guard let userInput = Double(userInputString) else {
            print("Incorrect input")
            return
        }
        
//        toCurrencyTextField.text = currencyFormatter.string(from: NSNumber(value: userInput))
        toCurrencyTextField.text = String(convert(userInput))
        
        
    }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        cadButton.isSelected.toggle()
        if cadButton.isSelected == true {
            currency = .cad
            toCurrencyLabel.text =  "Currency (CAD)"
            if mxnButton.isSelected == true {
                mxnButton.isSelected.toggle()
            }
        }
        
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        if mxnButton.isSelected == true{
            
            currency = .mxn
            toCurrencyLabel.text =  "Currency (MXN)"
            if cadButton.isSelected == true {
                cadButton.isSelected.toggle()
            }
        }
        
        
    }
    
    // MARK: - Helper Methods
    func convert(_ dollars: Double) -> Double {
        var convertedAmount: Double
        switch currency {
        case .cad:
            convertedAmount = dollars * 1.33
        case .mxn:
            convertedAmount = dollars * 19.70
        }
        return convertedAmount
    }
}

