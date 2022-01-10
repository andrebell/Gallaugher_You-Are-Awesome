//
//  ViewController.swift
//  Gallaugher_You-Are-Awesome
//
//  Created by Andre Bell on 10.01.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let messages: [String] = ["You Are Awesone!",
                              "You Are Great!",
                              "You Are Fantastic!",
                              "When The Genius Bar Needs Help, They Call You!",
                              "Fabulos, That's You!",
                              "You've Got The Design Skills Of Jony Ive!"]
    let totalNumberImages = 9
    
    var messageNumber: Int = 0
    var imageNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""
    }

    @IBAction func showMessagePressed(_ sender: UIButton) {
        var newMessageNumber: Int
        
        repeat {
            newMessageNumber = Int.random(in: 0...messages.count-1)
        } while newMessageNumber == messageNumber
        messageNumber = newMessageNumber
        messageLabel.text = messages[messageNumber]
        
        var newImageNumber: Int
        repeat {
            newImageNumber = Int.random(in: 0...totalNumberImages)
        } while newImageNumber == imageNumber
        imageNumber = newImageNumber
        imageView.image = UIImage(named: "image\(imageNumber)")
    }
    
}

