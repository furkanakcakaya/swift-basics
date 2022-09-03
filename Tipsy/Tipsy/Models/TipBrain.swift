//
//  TipBrain.swift
//  Tipsy
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 3.09.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct TipBrain{
    var billAmount: Double = 0.00
    var tipPercentage: Double = 0.0
    var splitCount: Int = 2
    
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
        return ((billAmount) * (1 + (tipPercentage))) / Double(splitCount)
    }
    
    func getResultLabel() -> String{
        return String(format: "%.2f", calculateTip())
    }
    
    func getDescription() -> String{
        let tip = Int(tipPercentage * 100)
        return "\(billAmount) is split between \(splitCount) people, with \(tip)% tip."
    }
}
