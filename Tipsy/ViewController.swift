//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipPc: Double = 0.0
    var splitNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipsChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        
        switch sender.titleLabel?.text {
        case zeroPcButton.titleLabel?.text:
            tipPc = 0.0
            zeroPcButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = false
        case tenPcButton.titleLabel?.text:
            tipPc = 0.1
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = true
            twentyPcButton.isSelected = false
        case twentyPcButton.titleLabel?.text:
            tipPc = 0.2
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = true
        default:
            tenPcButton.isSelected = true
        }
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = "\(splitNumber)"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = Double(billTextField.text ?? "0.0")
        print(tipPc)
        print(splitNumber)
        print(billAmount ?? "0.0")
        print(calculateSplit(billAmt: billAmount!))
        
    }
    
    func calculateSplit(billAmt:Double)->Double{
        let tipAmount = billAmt * tipPc
        let totalAmount = billAmt + tipAmount
        let totalSplitAmt = totalAmount / Double(splitNumber)
        return totalSplitAmt
    }
}

