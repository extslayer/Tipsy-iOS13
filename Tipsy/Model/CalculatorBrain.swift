//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Manmohan Shrivastava on 13/11/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var tipPc: Double = 0.0
    var splitNumber: Int = 0
    var totalSplitAmount: Double = 0.0
    
    
    
    func calculateSplit(billAmt:Double)->Double{
        let tipAmount = billAmt * tipPc
        let totalAmount = billAmt + tipAmount
        let totalSplitAmt = totalAmount / Double(splitNumber)
        return totalSplitAmt
    }
    
    func getTipPc()->Double{
        return tipPc
    }
    
    func getSplitNumber()->Int{
        return splitNumber
    }
    
    func getTotalSplitAmount()->Double{
        return totalSplitAmount
    }
}
