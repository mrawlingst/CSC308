// Author: Michael Rawlings
// Date: 03/08/18
// CSC 308 - Assignment 05
// Description: An app game where the user chooses 2
//          buttons out of 6 available buttons.
//          - Each button contains a value
//              - Every game, button will have different values
//          - Only 6 values are available:
//              - 0
//              - 100
//              - 200
//              - 300
//              - 400
//              - 500
//          - 'Help' button that brings up an alert view
//                 to provide info to user how to play
//          - When the user has picked two buttons, the game
//              ends and an alert view comes up displaying
//              the user's total score and option to play new
//              game and exit game

import UIKit

class ViewController: UIViewController {
    // Array of possible scores, will be shuffled around in randomizeButtons()
    var values = [0, 100, 200, 300, 400, 500]
    
    // Keep track of the total score player racked up
    var playerScore = 0
    
    // Was it player's first attempt?
    // Used to track how many times player pressed the buttons
    var firstAttempt = false
    
    // References to objects in storyboard
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var gameLabel: UILabel!
    
    // Holds all button objects - used to compare against sender arg
    var buttons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Used to compare against sender arg
        buttons.append(button0)
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        
        newGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Shuffle the values randomly
    // Each element in array represents the button
    // i.e. Button0 -> values[0]
    func randomizeButtons() {
        let r = values.count
        
        for i in 0 ... values.count-1 {
            let index = Int(arc4random()) % r
            let temp = values[index]
            values[index] = values[i]
            values[i] = temp
        }
    }
    
    // Actions taken when 1 of 6 buttons are pressed
    @IBAction func dollarButtonPressed(_ sender: UIButton) {
        for i in 0 ... buttons.count - 1 {
            if buttons[i] === sender {
                // Hide image and display its value
                sender.setBackgroundImage(nil, for: UIControlState.normal)
                sender.setTitle(String(values[i]), for: UIControlState.normal)
                
                // Add pressed button's value to total score
                playerScore = playerScore + values[i]
                
                // Prevents user from pressing this particular button again
                sender.isEnabled = false
                
                // Stop loop, since no point in continuing
                break
            }
        }
        
        // Determine if it's first attempt or second
        if !firstAttempt {
            firstAttempt = true
        } else {
            // Second attempt - end game, display alert with 2 options: Exit or Play again
            let alertController = UIAlertController(title: "Congratulations", message: "You've got \(playerScore) dollars!", preferredStyle: UIAlertControllerStyle.alert)
            let exitAction = UIAlertAction(title: "Exit", style: UIAlertActionStyle.default, handler: { (alertAction: UIAlertAction) in exit(0) })
            let playAgainAction = UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: { (alertAction: UIAlertAction) in self.newGame()})
            
            alertController.addAction(exitAction)
            alertController.addAction(playAgainAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
        gameLabel.text = "You've got \(playerScore) dollars!"
    }
    
    // Reset everything to default for new game
    func newGame() {
        for b in buttons {
            b.isEnabled = true
            b.setBackgroundImage(UIImage(named: "dollar.png"), for: UIControlState.normal)
            b.setTitle("", for: UIControlState.normal)
        }
        
        firstAttempt = false
        gameLabel.text = ""
        playerScore = 0
        
        randomizeButtons()
    }
    
    // Display an alert telling user how to play
    // Triggered when 'Help' button is pressed
    @IBAction func helpAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "How To Play", message: "Click two buttons to find your award", preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

