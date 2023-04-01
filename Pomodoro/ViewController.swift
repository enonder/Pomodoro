//
//  ViewController.swift
//  Pomodoro
//
//  Created by Elifnur Önder on 3/31/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    var timer = Timer()
    var duration: TimeInterval = 25 * 60
    var player: AVAudioPlayer!
    
    @IBAction func myButton(_ sender: UIButton) {
//        TODO: sender.currentTitle bug fix -- (check optional unwrapping)
        if(sender.currentTitle == "25:00"){
            duration = 25 * 60
        } else if(sender.currentTitle == "50:00"){
            duration = 50 * 60
        }

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decreaseTimer), userInfo: nil, repeats: false)
 
    }
    
    @objc func decreaseTimer() {
        if(duration != 0){
            duration -= 1
            label.text = timeString(time: duration)
        }else{
            timer.invalidate()
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
   
    func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }

 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Select time!"
    }


}

