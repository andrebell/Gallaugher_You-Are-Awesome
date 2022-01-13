//
//  ViewController.swift
//  Gallaugher_You-Are-Awesome
//
//  Created by Andre Bell on 10.01.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    let messages: [String] = ["You Are Awesone!",
                              "You Are Great!",
                              "You Are Fantastic!",
                              "When The Genius Bar Needs Help, They Call You!",
                              "Fabulos, That's You!",
                              "You've Got The Design Skills Of Jony Ive!"]
    let totalNumberImages = 10
    let totalNumberSounds = 6
    
    var messageNumber: Int = 0
    var imageNumber: Int = 0
    var soundNumber: Int = 0
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }

    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("🤬 ERROR: \(error.localizedDescription) Could not initialize AudioPlayer!")
            }
        } else {
            print("🤬 ERROR: Could not load sound data!")
        }
    }
    
    func newUniqueNumber(currentNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == currentNumber
        return newNumber
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
        messageNumber = newUniqueNumber(currentNumber: messageNumber, upperBound: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = newUniqueNumber(currentNumber: imageNumber, upperBound: totalNumberImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = newUniqueNumber(currentNumber: soundNumber, upperBound: totalNumberSounds-1)
        if playSoundSwitch.isOn {
            playSound(name: "sound\(soundNumber)")
        }
    }
    
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil {
            audioPlayer.stop()
        }
    }
}

