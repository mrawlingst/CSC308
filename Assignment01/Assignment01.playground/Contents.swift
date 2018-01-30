// Author: Michael Rawlings
// Date: 01/25/18
// CSC 308 - Assignment 01
// Description: Program to determine the lowest
//          or highest price of a product in the
//          product dictionary using a reference
//          to a function passed through price()

import Cocoa

// Find the lowest priced product in given dictionary and return the info (name and price of the product)
func lowestPrice(products: [String: (String, Double)]) -> (String, Double)
{
    let lowestProduct = products.min{a, b in a.value.1 < b.value.1}
    
    return (lowestProduct!.key, lowestProduct!.value.1)
}

// Find the highest priced product in given dictionary and return the info (name and price of the product)
func highestPrice(products: [String: (String, Double)]) -> (String, Double)
{
    let highestProduct = products.max{a, b in a.value.1 < b.value.1}
    
    return (highestProduct!.key, highestProduct!.value.1)
}

// Calls a referenced function and returns its result
func price(products: [String: (String, Double)], funcName: ([String : (String, Double)]) -> (String, Double)) -> (String, Double)
{
    return funcName(products)
}

// Products to test with
var products = [String: (String, Double)]()
products["Strawberry Icecream"] = ("Dessert", 6.99)
products["Orange"] = ("Fruit", 3.99)
products["Grapes"] = ("Fruit", 2.99)
products["Potato"] = ("Vegetable", 2.99)
products["Onion"] = ("Vegetable", 2.55)
products["Vanilla Icecream"] = ("Dessert", 5.99)

// Highest price using price()
print(price(products: products, funcName: highestPrice))

// Lowest price using price()
print(price(products: products, funcName: lowestPrice))

