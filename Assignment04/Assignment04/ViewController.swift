// Author: Michael Rawlings
// Date: 03/01/18
// CSC 308 - Assignment 04
// Description: An application that plays satellite animations
//          - Supports 5 different speeds
//              - 14 frames every 1 second
//              - 14 frames every 2 second
//              - 14 frames every 3 second
//              - 14 frames every 4 second
//              - 14 frames every 5 second
//          - Supports two type of images
//              - Visible
//              - Infrared
//          - Ability to stop or play animations

import UIKit

class ViewController: UIViewController {
    // Visible satellite animation images
    let visibleAnimationImages = [
        UIImage(named: "visible01.png")!,
        UIImage(named: "visible02.png")!,
        UIImage(named: "visible03.png")!,
        UIImage(named: "visible04.png")!,
        UIImage(named: "visible05.png")!,
        UIImage(named: "visible06.png")!,
        UIImage(named: "visible07.png")!,
        UIImage(named: "visible08.png")!,
        UIImage(named: "visible09.png")!,
        UIImage(named: "visible10.png")!,
        UIImage(named: "visible11.png")!,
        UIImage(named: "visible12.png")!,
        UIImage(named: "visible13.png")!,
        UIImage(named: "visible14.png")!
    ]
    
    // Infrared satellite animation images
    let infraredAnimationImages = [
        UIImage(named: "infrared01.png")!,
        UIImage(named: "infrared02.png")!,
        UIImage(named: "infrared03.png")!,
        UIImage(named: "infrared04.png")!,
        UIImage(named: "infrared05.png")!,
        UIImage(named: "infrared06.png")!,
        UIImage(named: "infrared07.png")!,
        UIImage(named: "infrared08.png")!,
        UIImage(named: "infrared09.png")!,
        UIImage(named: "infrared10.png")!,
        UIImage(named: "infrared11.png")!,
        UIImage(named: "infrared12.png")!,
        UIImage(named: "infrared13.png")!,
        UIImage(named: "infrared14.png")!
    ]
    
    // References to interface
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedStepper: UIStepper!
    @IBOutlet weak var controlButton: UIButton!
    
    // Used to determine if animation is running or not
    var running = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add animation images and the duration on load
        imageView.animationImages = visibleAnimationImages
        imageView.animationDuration = speedStepper.value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Change image and its animations when a type is selected
    @IBAction func imageTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            imageView.image = visibleAnimationImages[0]
            imageView.animationImages = visibleAnimationImages
        } else {
            imageView.image = infraredAnimationImages[0]
            imageView.animationImages = infraredAnimationImages
        }
        
        if running {
            imageView.startAnimating()
        }
    }
    
    // Change the speed of the animation and the info when changed
    @IBAction func changeSpeedByStepper(_ sender: UIStepper) {
        speedLabel.text = "Playback Speed: 14 frames in \(Int(speedStepper.value)) seconds"
        
        imageView.animationDuration = speedStepper.value
        
        if running {
            imageView.startAnimating()
        }
    }
    
    // Play or stop based on current state of the animation when pressed
    @IBAction func controlButtonIsClicked(_ sender: UIButton) {
        if running {
            imageView.stopAnimating()
            running = false
            controlButton.setTitle("Play", for: UIControlState.normal)
        } else {
            imageView.startAnimating()
            running = true
            controlButton.setTitle("Stop", for: UIControlState.normal)
        }
    }
}

