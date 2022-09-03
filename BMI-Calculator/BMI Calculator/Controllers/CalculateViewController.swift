//
//  ViewController.swift
//  BMI Calculator
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weigthSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weigthLabel: UILabel!
    
    var bmiBrain = BMICalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            heightLabel.text = String(format: "%.2fm", sender.value)
        case 2:
            weigthLabel.text = String(format: "%.0fkg", sender.value)
        default:
            print("default")
        }
    }
    

    @IBAction func calculatePressed(_ sender: Any) {
        bmiBrain.calculateBMI(weight: weigthSlider.value, height: heightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiBrain.getBMIValue()
            destinationVC.bmiAdvice = bmiBrain.getAdvice()
            destinationVC.bmiColor = bmiBrain.getColor()
        }
        
    }
}

