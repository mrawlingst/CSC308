// Author: Michael Rawlings
// Date: 04/03/18
// CSC 308 - Assignment 07
// Description: An app that loads a wiki page of
//              a given item selected from the following:
//              - Plant
//                  - Beargrass
//                  - Dandelion
//                  - Hibiscus
//              - Animal
//                  - Bear
//                  - Elephant
//                  - Lion
//                  - Panda
//                  - Penguin
//                  - Wolf
//              Also loads an image in the background related to
//              selected item.
//              Text's color are also customizable in hexadecimal values

import UIKit

class TextColorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let hexa = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    
    var newColor: UIColor?
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var previewLabel: UILabel!
    @IBOutlet weak var textColorPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let initialVC = presentingViewController as! ViewController
        newColor = initialVC.textColor
        updateColorInfo(newColor!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return hexa.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return hexa[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Red
        let redHex = hexa[textColorPicker.selectedRow(inComponent: 0)] + hexa[textColorPicker.selectedRow(inComponent: 1)]
        let redDec = (Int)(strtoul(redHex, nil, 16))
        
        // Green
        let greenHex = hexa[textColorPicker.selectedRow(inComponent: 2)] + hexa[textColorPicker.selectedRow(inComponent: 3)]
        let greenDec = (Int)(strtoul(greenHex, nil, 16))
        
        // Blue
        let blueHex = hexa[textColorPicker.selectedRow(inComponent: 4)] + hexa[textColorPicker.selectedRow(inComponent: 5)]
        let blueDec = (Int)(strtoul(blueHex, nil, 16))
        
        newColor = UIColor(red: (CGFloat)(redDec)/255.0, green: (CGFloat)(greenDec)/255.0, blue: (CGFloat)(blueDec)/255.0, alpha: 1.0)
        
        updateColorInfo(newColor!)
    }
    
    func updateColorInfo(_ color: UIColor) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        color.getRed(&r, green: &g, blue: &b, alpha: &a)
        r = r * 255
        g = g * 255
        b = b * 255
        
        redLabel.text = "\(Int(r))"
        greenLabel.text = "\(Int(g))"
        blueLabel.text = "\(Int(b))"
        previewLabel.textColor = color
        
        let redHex = String(Int(r), radix: 16)
        if redHex == "0" {
            textColorPicker.selectRow(0, inComponent: 0, animated: false)
            textColorPicker.selectRow(0, inComponent: 1, animated: false)
        } else {
            var comp = 0
            for character in redHex {
                textColorPicker.selectRow((Int)(strtoul(String(character), nil, 16)), inComponent: comp, animated: false)
                comp = comp + 1
            }
        }
        
        let greenHex = String(Int(g), radix: 16)
        if greenHex == "0" {
            textColorPicker.selectRow(0, inComponent: 2, animated: false)
            textColorPicker.selectRow(0, inComponent: 3, animated: false)
        } else {
            var comp = 2
            for character in greenHex {
                textColorPicker.selectRow((Int)(strtoul(String(character), nil, 16)), inComponent: comp, animated: false)
                comp = comp + 1
            }
        }
        
        let blueHex = String(Int(b), radix: 16)
        if blueHex == "0" {
            textColorPicker.selectRow(0, inComponent: 4, animated: false)
            textColorPicker.selectRow(0, inComponent: 5, animated: false)
        } else {
            var comp = 4
            for character in blueHex {
                textColorPicker.selectRow((Int)(strtoul(String(character), nil, 16)), inComponent: comp, animated: false)
                comp = comp + 1
            }
        }
    }
    
    @IBAction func dismissTextColorChooser(_ sender: UIButton) {
        let initialVC = presentingViewController as! ViewController
        initialVC.textColor = newColor!
        
        dismiss(animated: true, completion: nil)
    }
}
