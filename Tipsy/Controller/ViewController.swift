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
    var calculatorBrain = CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func tipsChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        
        switch sender.titleLabel?.text {
        case zeroPcButton.titleLabel?.text:
            calculatorBrain.tipPc = 0.0
            zeroPcButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = false
        case tenPcButton.titleLabel?.text:
            calculatorBrain.tipPc = 0.1
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = true
            twentyPcButton.isSelected = false
        case twentyPcButton.titleLabel?.text:
            calculatorBrain.tipPc = 0.2
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = true
        default:
            tenPcButton.isSelected = true
        }
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        calculatorBrain.splitNumber = Int(sender.value)
        splitNumberLabel.text = "\(calculatorBrain.splitNumber)"
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = Double(billTextField.text ?? "0.0")
        if billAmount == 0.0 {
            print("No amount added")
        }
        else{
            calculatorBrain.totalSplitAmount = calculatorBrain.calculateSplit(billAmt: billAmount ?? 0.0)
        }
        
        
        self.performSegue(withIdentifier: "gotoResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ResultViewController
        destinationVC?.totalSplitAmt = calculatorBrain.getTotalSplitAmount()
        destinationVC?.splitNumber = calculatorBrain.getSplitNumber()
        destinationVC?.tipPercentage = calculatorBrain.getTipPc()
        
    }
}
