//
//  ViewController.swift
//  swiftcourse_calculator
//
//  Created by TinaTien on 2016/3/16.
//  Copyright © 2016年 TinaTien. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var operandArray = [Double]()
    var operationArray = [String]()
    var firstDigit = true
    var operation = "="
    var operandA: Double = 0
    var displayValue: Double {
        
        get {
            return NSNumberFormatter().numberFromString(resultLabel.text!)!.doubleValue
        }
        set {
            resultLabel.text! = "\(newValue)"
            resultLabel.text = String(format: displayValue == floor(displayValue) ? "%g" : "%g", displayValue)
            firstDigit = true
            operation = "="
        }
    }

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func percentButton(sender: AnyObject) {
        displayValue = displayValue/100
    }
    @IBAction func resetResult(sender: AnyObject) {
        displayValue = 0
        operandArray = []
        operationArray = []
        firstDigit = true
    }
    
    @IBAction func changeOperate(sender: AnyObject) {
            displayValue = -displayValue
    }
    
    @IBAction func saveOperand(sender: UIButton) {
        operation = sender.currentTitle!
        operandA = displayValue
        firstDigit = true
        
        if operation != "=" {
            operandArray.append(operandA)
            operationArray.append(operation)
            }
    }
    
    
    @IBAction func calculateButton(sender: AnyObject) {
        if operandArray.count < 2 {
            switch operation {
            case "÷": displayValue = operandA / displayValue
            case "×": displayValue = operandA * displayValue
            case "−": displayValue = operandA - displayValue
            case "+": displayValue = operandA + displayValue
            default:break
            }
            
        } else {
        operandArray.append(displayValue)
        displayValue = operandArray.first!
        operandArray.removeAtIndex(operandArray.startIndex)
       
            for (var i=0; i < operationArray.count ; i++) {
                if operationArray[i] == "+" {
                    displayValue = displayValue + operandArray[i]
                } else if operationArray[i] == "−" {
                    displayValue = displayValue - operandArray[i]
                } else if operationArray[i] == "÷" {
                    displayValue = displayValue / operandArray[i]
                } else if operationArray[i] == "×" {
                    displayValue = displayValue * operandArray[i]
                }
            }
        }
        operandArray = []
        operationArray = []
    }
    
    @IBAction func numberButton(sender: UIButton) {
         let digit = sender.currentTitle!
         resultLabel.text = firstDigit ? digit : resultLabel.text! + digit
         firstDigit = false
    }
 

}

