// Author: Michael Rawlings
// Date: 03/21/18
// CSC 308 - Assignment 06
// Description: An app where the user matches the top
//          image with one of the two given images at
//          the bottom.
//              - When user picks one of two bottom images
//                  an alert pops up
//                  - If correctly picked, congratulates
//                  - If incorrectly picked, lets user know
//              - There are three categories:
//                  - Food
//                  - Flower
//                  - Car
//              - User can change catgory
//              - User can generate new pictures without changing
//                  category

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Set the new category and dismiss
    @IBAction func categoryPicked(_ sender: UIButton) {
        (presentingViewController as! ViewController).currentCategory = sender.currentTitle!
        dismiss(animated: true, completion: nil)
    }
}
