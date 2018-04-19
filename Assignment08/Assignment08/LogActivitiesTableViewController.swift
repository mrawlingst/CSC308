S

import UIKit

class LogActivitiesTableViewController: UITableViewController {
    // Categories available
    let categories = ["Conditioning Exercises", "Dancing", "Running", "Sports"]
    // Activities in each category
    let activities = [
        "Conditioning Exercises": ["Bicycling", "Rope Skipping", "Pilates", "Yoga"],
        "Dancing": ["Ballet", "Ballroom Dancing"],
        "Running": ["Marathon", "Jogging"],
        "Sports": ["Badminton", "Basketball", "Bowling", "Boxing", "Fencing"]
    ]
    
    // Used to access data (activityHours and activityCalories)
    var initialVC: TabBarViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initialVC = (parent as! TabBarViewController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Number of categories
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    // Set title of section for each category
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }

    // Number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities[categories[section]]!.count
    }
    
    // Set left and right label (activity and hours spent)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell")
        
        let exercise = activities[categories[indexPath.section]]![indexPath.row]
        let hours = initialVC!.activityHours[exercise] == 0.0 ? "" : (initialVC?.activityHours[exercise]?.description)! + " hours"
        cell!.textLabel!.text = exercise
        cell!.detailTextLabel!.text = hours
        
        return cell!
    }
    
    // Create and present an alert that askes user to input hours logged for the activity
    // Only shows decimal pad keyboard
    // When user presses OK, the rows will be refreshed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Activity Duration", message: "How many hours did you exercise?", preferredStyle: .alert)
        alertController.addTextField { (textField) in textField.text = "" }
        alertController.textFields![0].keyboardType = UIKeyboardType.decimalPad
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { (alertAction: UIAlertAction) in
            let value: Double = Double(alertController.textFields![0].text!)!
            let exercise = self.activities[self.categories[indexPath.section]]![indexPath.row]
            self.initialVC!.activityHours[exercise] = value
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        })
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
}
