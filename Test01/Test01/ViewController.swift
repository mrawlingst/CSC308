// Author: Michael Rawlings
// Date: 03/01/18
// CSC 308 - Test 01
// Description: Application that displays course
//          info and challenge level (number of stars)
//          Following classes and its stars are available:
//              - CSC 185: 1
//              - CSC 195: 4
//              - CSC 190: 3
//              - CSC 191: 3
//              - CSC 308: 2
//              - CSC 310: 3
//              - CSC 313: 2
//              - CSC 340: 3

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var classesSeg: UISegmentedControl!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classInfoWebView: WKWebView!
    
    // No outlet for star 1 since it'll always be displayed, no point in hiding 
    @IBOutlet weak var starImage2: UIImageView!
    @IBOutlet weak var starImage3: UIImageView!
    @IBOutlet weak var starImage4: UIImageView!
    
    // Classes in each category
    // classesDB[category][class]
    let classesDB = [
        // Math-Related
        0: ["185", "195"],
        
        // Programming
        1: ["190", "191", "308"],
        
        // Other
        2: ["310", "313", "340"]
    ]
    
    // Number of stars attributed to each class
    // starsDB[class]
    let starsDB = [
        "185": 1,
        "195": 4,
        "190": 3,
        "191": 3,
        "308": 2,
        "310": 3,
        "313": 2,
        "340": 3
    ]
    
    // Used to keep track of current class
    var currentClass = "185"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classSegChanged(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Load class info from url and show its description and stars
    func loadClassInfo(_ sender: Any?) {
        classLabel.text = "CSC \(currentClass)"
        let classURLString = "http://computerscience.eku.edu/course-descriptions#CSC\(currentClass)"
        
        if let classURL = URL(string: classURLString) {
            classInfoWebView.load(URLRequest(url: classURL))
        }
        
        // Display stars based on the current shown class
        updateStars()
    }
    
    // Update category based on selected segemented control
    @IBAction func classSegChanged(_ sender: UISegmentedControl?) {
        currentClass = classesDB[classesSeg.selectedSegmentIndex]![0]
        loadClassInfo(nil)
    }
    
    // Next class in the category when button is clicked
    @IBAction func nextButtonClicked(_ sender: UIButton) {
        for i in 0 ... classesDB[classesSeg.selectedSegmentIndex]!.count - 1 {
            if classesDB[classesSeg.selectedSegmentIndex]![i] == currentClass {
                if i == classesDB[classesSeg.selectedSegmentIndex]!.count - 1 {
                    // End of list, go back to beginning
                    currentClass = classesDB[classesSeg.selectedSegmentIndex]![0]
                    break
                } else {
                    // Continue to next class in the list
                    currentClass = classesDB[classesSeg.selectedSegmentIndex]![i+1]
                    break
                }
            }
        }
        
        // Update class info
        loadClassInfo(nil)
    }
    
    // Update the star rating for current selected class
    func updateStars() {
        let stars = starsDB[currentClass]!
        
        var showStars = [false, false, false]
        
        for i in 2 ... 4 {
            if stars >= i {
                showStars[i-2] = false
            } else {
                showStars[i-2] = true
            }
        }
        
        starImage2.isHidden = showStars[0]
        starImage3.isHidden = showStars[1]
        starImage4.isHidden = showStars[2]
    }
}
