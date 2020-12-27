//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Sumithra Candasamy on 12/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPersonAmt: String = ""
    var settingsText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        totalLabel.text = totalPerPersonAmt
        settingsLabel.text = settingsText
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
