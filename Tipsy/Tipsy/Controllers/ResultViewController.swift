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
        resultLabel.text = tipBrain?.getResultLabel()
        descriptionLabel.text = tipBrain?.getDescription()
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
