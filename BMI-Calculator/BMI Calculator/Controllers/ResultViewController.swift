//
//  ResultViewController.swift
//  BMI Calculator
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue :String?
    var bmiColor : UIColor?
    var bmiAdvice : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = bmiAdvice
        view.backgroundColor = bmiColor
    }

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
