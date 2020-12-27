//
//  TipsCalculator.swift
//  Tipsy
//
//  Created by Sumithra Candasamy on 12/27/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipsCalculator {
    
    var tips: Tips?
    
    mutating func calculateTotalAmtPerPerson(billAmt: Float?, tipValue: Float?, splitNbr: Double?) {
        let tipAmt = billAmt! * tipValue!
        let tipPerc = tipValue! * 100
        let totalBillWithTips = billAmt! + tipAmt
        let totPerPerson = totalBillWithTips / Float(splitNbr!)
        
        tips = Tips(billPerPerson: totPerPerson, tipsPerc: tipPerc, totPersons: Int(splitNbr!))
               
    }
    
    func getAmtPerPerson() -> Float {
        return tips?.billPerPerson ?? 0.0
    }
    
    
    func getTipPerc() -> Float {
        return tips?.tipsPerc ?? 0.0
    }
    
    
    func getTotNbrPersons() -> Int {
        return tips?.totPersons ?? 0
    }
    
    
    
    
    
}
