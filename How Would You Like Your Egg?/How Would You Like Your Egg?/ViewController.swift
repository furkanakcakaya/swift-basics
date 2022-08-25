//
//  ViewController.swift
//  How Would You Like Your Egg?
//
//  Created by Furkan Akçakaya on 23.08.2022.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    let eggTimes = ["hard":12,
                    "medium":9,
                    "soft":6]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func eggTypeSelected(_ sender: UIButton) {
        timer.invalidate()
        
        if let eggType:String = sender.titleLabel?.text as? String{
            let time = eggTimes[eggType]! * 60
            var secondsRemaining = time
//                                            .... this should be 1.00 ....
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [self] (timer) in
                    if secondsRemaining > 0 {
                        secondsRemaining -= 1
                        self.progressBar.progress = (Float(time)-Float(secondsRemaining))/Float(time)
                    } else {
                        ring()
                        timer.invalidate()
                        self.titleLabel.text = "DONE!"
                    }
                }
            
        }
    }
    
    func ring(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        if(url != nil){
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}

