// Author: Michael Rawlings
// Date: 04/17/18
// CSC 308 - Assignment 07
// Description: An app that calculates your BMR
//              and total calories user has burned
//              through activies which user logs
//              in hours.

import UIKit

class TabBarViewController: UITabBarController {
    // Settings
    var gender: Int = 1 // 0 - Male, 1 - Female
    var age: Int = 20
    var weight: Float = 55
    var height: Float = 165
    
    // Log Activities
    var activityHours = [
        "Bicycling": 0.0,
        "Rope Skipping": 0.0,
        "Pilates": 0.0,
        "Yoga": 0.0,
        "Ballet": 0.0,
        "Ballroom Dancing": 0.0,
        "Marathon": 0.0,
        "Jogging": 0.0,
        "Badminton": 0.0,
        "Basketball": 0.0,
        "Bowling": 0.0,
        "Boxing": 0.0,
        "Fencing": 0.0
    ] as [String: Double]
    
    // Calories Database for each activity
    let activityCalories = [
        "Bicycling": 398,
        "Rope Skipping": 699,
        "Pilates": 170,
        "Yoga": 227,
        "Ballet": 284,
        "Ballroom Dancing": 443,
        "Marathon": 755,
        "Jogging": 398,
        "Badminton": 312,
        "Basketball": 369,
        "Bowling": 170,
        "Boxing": 312,
        "Fencing": 341
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
