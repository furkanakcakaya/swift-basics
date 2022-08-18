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
            playSound(name: noteName)
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
