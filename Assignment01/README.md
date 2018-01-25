## Assignment 1
Due 2/1

Write a **MacOS** Playground file in Swift to
* Create a dictionary of products, in which each key is a product name (e.g., "Strawberry Icecream") and its value is a tuple including the category and the price of the corresponding product (e.g., `("Dessert", 3.99)`)
* Declare three functions:
    1. `lowestPrice` function returns name and price of the product that has the lowest price among all given products.
    2. `highestPrice` function returns name and price of the product that has the highest price among all given products.
    3. `price` function takes a product dictionary and **a reference to a function** as arguments. It returns the information (i.e., product name and price) of the product that has either the lowest price or the highest price.
* Call function `price` and pass a reference to `lowestPrice`, and make sure you get the correct returned value.
* Call function `price` and pass a reference to `highestPrice`, and make sure you get the correct returned value.

**Note**: Your code should include comments as specified in the course syllabus.

**Clarifications**
* `lowestPrice` and `highestPrice` both takes a product dictionary as an argument.
* `price` performs similar to `f6()` in *MyPlayground02* file provided by instructor.
    * Use that file for reference
