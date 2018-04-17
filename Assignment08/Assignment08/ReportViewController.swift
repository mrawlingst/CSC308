// Author: Michael Rawlings
// Date: 04/17/18
// CSC 308 - Assignment 07
// Description: An app that calculates your BMR
//              and total calories user has burned
//              through activies which user logs
//              in hours.

import UIKit

class ReportViewController: UIViewController {
    @IBOutlet weak var reportLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Generate report
    override func viewWillAppear(_ animated: Bool) {
        let initialVC = parent as! TabBarViewController
        
        var report = "Your Basic Metabolic Rate (BMR): \(calculateBMR())"
        report += "\n\nCalorie you have burned today: "
        
        // Calculate the total calories burned - could be improved or merged with next loop
        var totalCalories: Double = 0
        for (key, value) in initialVC.activityHours {
            if value > 0 {
                totalCalories += Double(initialVC.activityCalories[key]!) * value
            }
        }
        report += totalCalories.description
        
        // Add each activity and amount of calories burned to report
        for (key, value) in initialVC.activityHours {
            if value > 0 {
                report += "\n\t\(key): \(Double(initialVC.activityCalories[key]!) * value)"
            }
        }
        
        reportLabel.text = report
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Calculate and return the resulting BMR
    func calculateBMR() -> Float {
        let initialVC = parent as! TabBarViewController

        let age = initialVC.age
        let weight = initialVC.weight
        let height = initialVC.height
        
        // Swift doesnt seem to support PEMDAS in one line or too much to handle
        var bmr = 10 * weight
        bmr += 6.25 * height
        bmr -= 5 * Float(age)
        
        // Male
        if initialVC.gender == 0 {
            bmr += 5
        }
        //Female
        else {
            bmr -= 161
        }
        
        return bmr
    }
}
