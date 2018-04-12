// Author: Michael Rawlings
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Set values for all settings when view appears
    override func viewWillAppear(_ animated: Bool) {
        let initialVC = parent as! TabBarViewController
        genderPicker.selectRow(initialVC.gender, inComponent: 0, animated: false)
        ageTextField.text = String(initialVC.age)
        weightTextField.text = String(initialVC.weight)
        heightTextField.text = String(initialVC.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Only one column for the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    // Only two rows for the picker (Male, Female)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    // Set title for row: 0 - Male, 1 - Female
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return row == 0 ? "Male" : "Female"
    }
    
    @IBAction func updateSettings(_ sender: UITextField) {
        (parent as! TabBarViewController).age = Int(sender.text!)!
    }
    
    @IBAction func dismissKeyboard(_ sender: UITextField) {
        self.view.endEditing(true)
    }
}
