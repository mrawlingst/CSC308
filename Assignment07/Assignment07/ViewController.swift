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
import WebKit

class ViewController: UIViewController {
    let categories = [
        0: ["Beargrass", "Dandelion", "Hibiscus"],
        1: ["Bear", "Elephant", "Lion", "Panda", "Penguin", "Wolf"]
    ]
    
    let images = [
        "Bear": UIImage(named: "bear.png"),
        "Beargrass": UIImage(named: "beargrass.png"),
        "Dandelion": UIImage(named: "dandelion.png"),
        "Elephant": UIImage(named: "elephant.png"),
        "Hibiscus": UIImage(named: "hibiscus.png"),
        "Lion": UIImage(named: "lion.png"),
        "Panda": UIImage(named: "panda.png"),
        "Penguin": UIImage(named: "penguin.png"),
        "Wolf": UIImage(named: "wolf.png")
    ]
    
    var currentCategory = 0
    var currentObject = 1
    //var currentObject = "Dandelion"
    var textColor: UIColor = UIColor(red: 100/255, green: 50/255, blue: 200/255, alpha: 1)
    
    @IBOutlet weak var wikiLabel: UILabel!
    @IBOutlet weak var wikiImageView: UIImageView!
    @IBOutlet weak var wikiWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //updateInfo(categories[currentCategory]![currentObject])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateInfo(categories[currentCategory]![currentObject])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateInfo(_ object: String) {
        let wikiURLString = "https://en.wikipedia.org/wiki/\(object)"
        
        if let wikiURL = URL(string: wikiURLString) {
            wikiWebView.load(URLRequest(url: wikiURL))
        }
        
        //
        wikiImageView.image = images[object]!
        wikiLabel.text = object
        wikiLabel.textColor = textColor
    }
}
