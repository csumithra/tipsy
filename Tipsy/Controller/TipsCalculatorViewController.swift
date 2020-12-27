//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class TipsCalculatorViewController: UIViewController {

    var tipsCalculator = TipsCalculator()
    
    @IBOutlet weak var billTextfield: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctbutton: UIButton!
    
    @IBOutlet weak var splitNbrLabel: UILabel!
    
    var billAmt: Float?
    
    var tipSelected: String?
    var tipValue: Float?
    
    var splitValue: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextfield.endEditing(true)
        
        tipSelected = sender.currentTitle!
                
        if tipSelected == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctbutton.isSelected = false
            tipValue = 0.0
        } else if tipSelected == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctbutton.isSelected = false
            tipValue = 0.10
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctbutton.isSelected = true
            tipValue = 0.20
        }
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNbrLabel.text = String(format: "%0.f",sender.value)
        splitValue = sender.value
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        billAmt = Float(billTextfield.text!)
               
        tipsCalculator.calculateTotalAmtPerPerson(billAmt: billAmt!, tipValue: tipValue!, splitNbr: splitValue!)
     
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        
//        let splitNumber = Int(splitValue!)
        
        destinationVC.totalPerPersonAmt = String(format: "%.2f", tipsCalculator.getAmtPerPerson())
        destinationVC.settingsText = "Split between \(tipsCalculator.getTotNbrPersons()) people, with \(tipsCalculator.getTipPerc())% tip"
        
        
    }

}

