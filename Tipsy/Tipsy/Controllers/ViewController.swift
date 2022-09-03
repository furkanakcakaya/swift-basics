//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var tipBrain = TipBrain()

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        if let billAmount = Double(billAmountTextField.text!){
            tipBrain.setBillAmount(bill: billAmount)
        }
        
        self.performSegue(withIdentifier: "toResult", sender: self)
    }
 
    
    @IBAction func onTipSelected(_ sender: UIButton) {
        switch sender.accessibilityIdentifier {
        case "zero":
            zeroButton.isSelected = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
            tipBrain.setTipPercentage(tip: 0.0)
        case "ten":
            zeroButton.isSelected = false
            tenButton.isSelected = true
            twentyButton.isSelected = false
            tipBrain.setTipPercentage(tip: 0.1)
        case "twenty":
            zeroButton.isSelected = false
            tenButton.isSelected = false
            twentyButton.isSelected = true
            tipBrain.setTipPercentage(tip: 0.2)
        default:
            print("0")
        }
    }
    
    @IBAction func splitStepper(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        tipBrain.setSplitCount(split: Int(sender.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tipBrain = tipBrain
        }
    }
    
    
}

