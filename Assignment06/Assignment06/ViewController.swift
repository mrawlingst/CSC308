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

class ViewController: UIViewController {
    // Dictionary to hold each category and its images
    let categoryImages = [
        "Car": [UIImage(named: "car1"), UIImage(named: "car2"), UIImage(named: "car3")],
        "Food": [UIImage(named: "food1"), UIImage(named: "food2"), UIImage(named: "food3")],
        "Flower": [UIImage(named: "flower1"), UIImage(named: "flower2"), UIImage(named: "flower3")]
    ]
    
    // References to the objects
    @IBOutlet weak var questionPicture: UIImageView!
    @IBOutlet weak var candidatePicture1: UIButton!
    @IBOutlet weak var candidatePicture2: UIButton!
    
    // Active category
    var currentCategory = ""
    
    // Which button has the correct answer
    // False - Left button
    // True - Right button
    var correctButton = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentCategory = getRandomCategory()
        randomizeImages()
    }
    
    // Update images when the view appears again
    override func viewWillAppear(_ animated: Bool) {
        randomizeImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Returns randomly picked category in dictionary
    func getRandomCategory() -> String {
        let randNum = Int(arc4random()) % categoryImages.keys.count
        return Array(categoryImages.keys)[randNum]
    }
    
    // Return random image in given category
    func getRandomImage(category: String) -> UIImage {
        let count = categoryImages[category]!.count
        let randNum = Int(arc4random()) % count
        return categoryImages[category]![randNum]!
    }
    
    // Randomize images for question and both candidate pictures
    @IBAction func randomizeImages() {
        // Question picture
        let prevImg = questionPicture.image
        while prevImg == questionPicture.image {
            questionPicture.image = getRandomImage(category: currentCategory)
        }
        
        // Correct candidate picture
        var correctCandidate = questionPicture.image
        while correctCandidate == questionPicture.image {
            correctCandidate = getRandomImage(category: currentCategory)
        }
        
        // Incorrect candidate picture
        var incorrectCategory = getRandomCategory()
        while incorrectCategory == currentCategory {
            incorrectCategory = getRandomCategory()
        }
        let incorrectCandidate = getRandomImage(category: incorrectCategory)
        
        // Determine which button will contain the correct answer
        correctButton = Int(arc4random()) % 2 == 1
        
        // Button 1 (Left)
        if correctButton {
            candidatePicture1.setBackgroundImage(correctCandidate, for: UIControlState.normal)
            candidatePicture2.setBackgroundImage(incorrectCandidate, for: UIControlState.normal)
        } else { // Button 2 (Right)
            candidatePicture2.setBackgroundImage(correctCandidate, for: UIControlState.normal)
            candidatePicture1.setBackgroundImage(incorrectCandidate, for: UIControlState.normal)
        }
    }
    
    // Both candidate buttons triggers this
    @IBAction func candidateButtonClicked(_ sender: UIButton) {
        // Quickly determine which button was pressed
        var left = false
        if sender === candidatePicture1 {
            left = true
        }
        
        // Quick check if left button was the correct button
        // before changing the message
        var message = "Sorry, you are wrong!"
        if left == correctButton {
            message = "Congratulations. You are correct!"
        }
        
        // Display alert and randomize images on OK click
        let alertController = UIAlertController(title: "Thank you.", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { (alertAction: UIAlertAction) in self.randomizeImages() })
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}

