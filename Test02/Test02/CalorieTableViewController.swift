// Author: Michael Rawlings
// Date: 04/19/18
// CSC 308 - Test 02
// Description: An app that calculates total
//              calories in selected food with
//              given weight (in lbs and oz)

import UIKit

class CalorieTableViewController: UITableViewController {
    // Sections of each food group
    let sections = ["Diary", "Grains", "Fruits"]
    // Food in each section
    let food = [
        "Diary": ["Milk", "Yogurt", "Cheese"],
        "Grains": ["Rice", "Oats"],
        "Fruits": ["Apple", "Banana"]
    ]
    
    // Table of calories for each food to calculate total calories
    let caloriesInFood = [
        "Milk": 12,
        "Yogurt": 17,
        "Cheese": 114,
        "Rice": 37,
        "Oats": 110,
        "Apple": 15,
        "Banana": 25
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // Set title of each section (food group)
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    // Number of food in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food[sections[section]]!.count
    }
    
    // Set label of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell")
        
        cell!.textLabel!.text = food[sections[indexPath.section]]![indexPath.row]
        return cell!
    }
    
    // Display an alert that shows total calories for the selected food (cell)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let initialVC = (parent as! TabBarViewController)
        
        let currentFood = food[sections[indexPath.section]]![indexPath.row]
        let totalCalories = initialVC.totalOunces * caloriesInFood[currentFood]!
        
        let alertController = UIAlertController(title: currentFood, message: "Calories in \(initialVC.totalOunces) ounces of \(currentFood): \(totalCalories)", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
