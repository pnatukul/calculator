//
//  ViewController.swift
//  calculator
//
//  Created by Pradeepthi N on 16/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultLabel.text = ""
        
    }
    
    
    @IBAction func numberPresssed(_ sender: Any) {
        
        guard let tag = (sender as? UIButton)?.tag else {return}
        
  //      if let resultText = resultLabel.text{
            if isPerformingOperation == true {
                isPerformingOperation = false
                resultLabel.text = String(tag - 1)
            } else {
                resultLabel.text = resultLabel.text! + String(tag - 1)
            }
        
        numberOnScreen = Double(resultLabel.text!)!
        
   }
    
    @IBAction func operatorPressed(_ sender: Any) {
        let tag = (sender as! UIButton).tag
      
        //clear button
        if tag == 16 {
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
        
        // operation /(11),*(12),+(14),-(13),=(15)
        if (tag == 11 || tag == 12 || tag == 13 || tag == 14) {
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!
            operation = tag
            
            if tag == 11 {
                resultLabel.text = "/"
            } else if tag == 12 {
                resultLabel.text = "*"
            } else if tag == 13 {
                resultLabel.text = "-"
            } else if tag == 14{
                resultLabel.text = "+"
            }
        
        }else if tag == 17 {
            isPerformingOperation = false
            resultLabel.text = resultLabel.text! + "."
        }
        else if tag == 15 {
            if operation == 11 {
                resultLabel.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 12 {
                resultLabel.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 13 {
                resultLabel.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 14 {
                resultLabel.text = String(previousNumber + numberOnScreen)
            }
        }
        
    }
    
}

