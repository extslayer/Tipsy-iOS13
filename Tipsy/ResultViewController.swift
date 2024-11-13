//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Manmohan Shrivastava on 12/11/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalSplitAmt: Double = 0.0
    var splitNumber : Int = 0
    var tipPercentage: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "$%.2f", totalSplitAmt)
        settingsLabel.text = "Split between \(splitNumber) people, with \(Int(tipPercentage*100))% tip."
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
