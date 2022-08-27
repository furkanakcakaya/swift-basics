//
//  ViewController.swift
//  Curiosity Quiz
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var btnTrue: UIButton!
    
    
    
    
    var questionNo = 0
    let quiz = [
        ["9 * 9 = 91", "False"],
        ["8 - 9 = 1", "True"],
        ["4 + 6 > 10", "False"],
        ["26 - 19 <= 8", "True"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quiz[questionNo][0]
        
    }

    
    @IBAction func answered(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel?.text!
        let actualAnswer = quiz[questionNo][1]
        
        if(userAnswer == actualAnswer){
            print("Congratz!")
        }else{
            print(":(")
        }
        
        if(quiz.count > questionNo + 1){
            questionNo += 1
        }
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNo][0]
        progressBar.progress = Float(questionNo)/Float(quiz.count+1)
    }

}

