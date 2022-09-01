//
//  BMICalculator.swift
//  BMI Calculator
//

import Foundation
import CoreText
import UIKit


struct BMICalculator{
    var bmi: BMI?
    
    func getBMIValue() -> String{
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice."
    }
    func getColor() -> UIColor{
        return bmi?.color ?? .gray
    }
    
    mutating func calculateBMI(weight: Float, height: Float){
        let bmiVal = weight / pow(height, 2)
        if bmiVal<18.5 {
            bmi = BMI(value: bmiVal, advice: "Gotta eat some more!", color: .systemBlue)
        }else if bmiVal < 24.9 {
            bmi = BMI(value: bmiVal, advice: "Just right! Well done.", color: .systemGreen)
        }else{
            bmi = BMI(value: bmiVal, advice: "You might consider losing a pound or two", color: .systemRed)
        }
    }
}
