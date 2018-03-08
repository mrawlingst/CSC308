//
//  ViewController.swift
//  Assignment05
//
//  Created by Michael Rawlings on 3/1/18.
//  Copyright © 2018 cs.eku.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func helpAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "How To Play", message: "Click two buttons to find your award", preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

