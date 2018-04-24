// Author: Michael Rawlings
// Date: 02/22/18
// CSC 308 - Assignment 03
// Description: A body fat calculator using YMCA's formula.
//          - Supports different units of measurements
//              - Pounds/Kilograms
//              - Inches/Centimeters
//          - Different formula for each gender
//          - Generates a report for the user at the press of
//            a button

import UIKit

class ViewController: UIViewController {
    // All the inputs the user can modify
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var genderInput: UISegmentedControl!
    @IBOutlet weak var lengthUnitInput: UISegmentedControl!
    @IBOutlet weak var weightUnitInput: UISegmentedControl!
    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var waistInput: UITextField!
    @IBOutlet weak var reportView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // Print the report in the view when pressed
    @IBAction func generateReport(_ sender: UIButton) {
        // Make sure all text fields are filled before calculating
        if checkForEmptyInputs() {
            reportView.text = "One of the fields are empty. Please complete the form."
        } else {
        reportView.text = "Hi, \(nameInput.text!), thank you for using this body fat calculator. Your body fat percentage is estimated to be \(String(format: "%.2f", calcBodyFat()))%, according to the YMCA method."
        }
    }
    
    // Check if any of the text fields are empty
    func checkForEmptyInputs() -> Bool {
        return (nameInput.text?.isEmpty)! || (weightInput.text?.isEmpty)! || (waistInput.text?.isEmpty)!
    }
    
    // Calculate the body fat and return the value
    func calcBodyFat() -> Double {
        var bodyFat = 0.0, weight = 0.0, waist = 0.0
        
        // Get weight in pounds
        if weightUnitInput.selectedSegmentIndex == 0 {
            weight = Double(weightInput.text!)!
        } else {
            weight = Double(weightInput.text!)! * 2.2046
        }
        
        // Get waist in inches
        if lengthUnitInput.selectedSegmentIndex == 0 {
            waist = Double(waistInput.text!)!
        } else {
            waist = Double(waistInput.text!)! / 2.54
        }
        
        // Male
        if genderInput.selectedSegmentIndex == 0 {
            bodyFat = (-98.42 + 4.15 * waist - 0.082 * weight) / weight
        } else { // Female
            bodyFat = (-76.76 + 4.15 * waist - 0.082 * weight) / weight
        }
        
        // Multiply it to be percent
        bodyFat = bodyFat * 100
        
        return bodyFat
    }
    
    @IBAction func dismissKeyboard(_ sender: UIButton) {
        self.view.endEditing(true)
    }
}

