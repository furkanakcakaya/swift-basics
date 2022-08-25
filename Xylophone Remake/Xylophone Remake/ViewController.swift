//
//  ViewController.swift
//  Xylophone Remake
//



import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        if let noteName: String = sender.titleLabel?.text as? String {
            dimButton(button: sender)
            playSound(name: noteName)
        }
    }
    
    func dimButton(button:UIButton){
        let originalColor = button.backgroundColor
        button.backgroundColor = originalColor?.withAlphaComponent(0.6)
        _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { timer in
                button.backgroundColor = originalColor
        }
    }
        
    func playSound(name:String) {
        let url = Bundle.main.url(forResource: name, withExtension: "wav",
                                  subdirectory: "Sounds")
        if(url != nil){
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }else{
            print("nil")
        }
    }
    
}
