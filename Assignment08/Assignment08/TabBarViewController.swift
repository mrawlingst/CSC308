// Author: Michael Rawlings

import UIKit

class TabBarViewController: UITabBarController {
    var gender: Int = 1 // 0 - Male, 1 - Female
    var age: Int = 20
    var weight: Float = 55
    var height: Float = 165
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
