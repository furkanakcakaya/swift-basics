//
//  ViewController.swift
//  Curiosity Quiz
//
//  Created by Furkan on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    var quizLgic = QuizLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOne.setTitleColor(.white, for: .normal)
        buttonTwo.setTitleColor(.white, for: .normal)
        buttonThree.setTitleColor(.white, for: .normal)
        updateUI()
    }
    
    @IBAction func answered(_ sender: UIButton) {
        if let userAnswer = sender.currentTitle {
            if(quizLgic.checkAnswer(userAnswer: userAnswer)){
                sender.backgroundColor = .systemGreen
            }else{
                sender.backgroundColor = .systemRed
            }
        }
        
        quizLgic.nextQuestion()
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.20, repeats: false) { timer in
            self.updateUI()
        }
    }
    
    func updateUI(){
        questionLabel.text = quizLgic.questionText()
        updateProgressBar(to: quizLgic.getProgress())
        
        scoreLabel.text = quizLgic.getScore()
        let answers = quizLgic.getAnswers()
        
        buttonOne.backgroundColor = UIColor.clear
        buttonTwo.backgroundColor = UIColor.clear
        buttonThree.backgroundColor = UIColor.clear
        buttonOne.setTitle(answers[0], for: .normal)
        buttonTwo.setTitle(answers[1], for: .normal)
        buttonThree.setTitle(answers[2], for: .normal)
        
    }
    
    func updateProgressBar(to: Float){
        let timeInterval:Double = 0.01
        let incrementConstant:Float = 0.01
        
        _ = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { timer in
            if(self.progressBar.progress + incrementConstant >= to){
                self.progressBar.progress = to
                timer.invalidate()
            }else{
                self.progressBar.progress += incrementConstant
            }
        }
    }

}

