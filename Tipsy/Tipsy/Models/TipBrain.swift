//
//  TipBrain.swift
//  Tipsy
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 3.09.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain{
    var billAmount: Double?
    var tipPercentage: Double?
    var splitCount: Int?
    
    mutating func setBillAmount(bill: Double){
        billAmount = bill
    }
    mutating func setTipPercentage(tip: Double){
        tipPercentage = tip
    }
    mutating func setSplitCount(split: Int){
        splitCount = split
    }
    
    func calculateTip() -> Double{
        return ((billAmount ?? 0.0) * (1 + (tipPercentage ?? 0.1))) / Double(splitCount ?? 2)
    }
}
