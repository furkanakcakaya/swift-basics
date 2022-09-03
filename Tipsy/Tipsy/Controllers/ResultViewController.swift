//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 3.09.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var tipBrain: TipBrain?

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(format: "%.2f", tipBrain?.calculateTip() ?? 0)
        let bill = tipBrain?.billAmount ?? 0
        let split = tipBrain?.splitCount ?? 2
        let tip = (tipBrain?.tipPercentage ?? 0.1) * 100
        descriptionLabel.text = "\(bill) is split between \(split) people, with \(tip)% tip."
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
