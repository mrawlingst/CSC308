## Assignment 5
Due 3/8

Write a game for iPhone 8:
* The application should provide a button "Help" to trigger the display of an alert view to tell the user how to play the game (as in **Figure 1**).
* The application inludes six buttons that are associated with random integers among 0, 100, 200, 300, 400, and 500 *without repeat*.
    * The buttons should have background images.
    * The application allows the users to click any two of these buttons.
* Every time a button is clicked, its associated number should be revealed and displayed on the button, and the total number of dollars that the user has earned is displayed at the bottom of the screen (as in **Figure 2 and 3**).
* After the user has clicked two buttons, another alert view is displayed to report the result of the game and allow the user to choose from playing again or exiting the game (as in **Figure 3**).

![example image](example.png)

**Hint**:
* Statement `exit(0)` can be used to exit an application
* Suppose the outlet connected to a button is "button1", the following statements will change its background image:
```swift
// the button will not have any background image
button1.setBackgroundImage(nil, for: UIControlState.normal)

// the button will use dollar.jpg as the background image
button1.setBackgroundImage(UIImage(named: "dollar.jpg"), for: UIControlState.normal)
```
* The following statements generate a random integer among 0-9:
```swift
var t: Int = 10
var randNum = Int(arc4random()) % t
```
