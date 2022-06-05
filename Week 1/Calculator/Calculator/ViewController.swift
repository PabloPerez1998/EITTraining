//
//  ViewController.swift
//  Calculator
//
//  Created by Consultant on 6/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    var workingsValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear()
        // Do any additional setup after loading the view.
    }
    
    func clear(){
        workingsValue = ""
        result.text = ""
    }
    
    func addToWorkingsValue(value: String){
        workingsValue += value
        result.text = workingsValue
    }

    @IBAction func clearInput(_ sender: Any) {
        clear()
    }
    
    @IBAction func changeSign(_ sender: Any) {
        if(workingsValue.count > 0){
            let firstCharacter = String(workingsValue.prefix(1))
            if(firstCharacter == "-"){
                workingsValue.replaceSubrange(...workingsValue.startIndex, with: "")
            }else{
                workingsValue = "-" + workingsValue
            }
            result.text = workingsValue
        }
    }
    
    
    @IBAction func percentage(_ sender: Any) {
        addToWorkingsValue(value: "%")
    }
    
    @IBAction func divide(_ sender: Any) {
        addToWorkingsValue(value: "/")
    }
    
    @IBAction func multiply(_ sender: Any) {
        addToWorkingsValue(value: "*")
    }
    
    @IBAction func minus(_ sender: Any) {
        addToWorkingsValue(value: "-")
    }
    
    @IBAction func add(_ sender: Any) {
        addToWorkingsValue(value: "+")
    }
    
    @IBAction func point(_ sender: Any) {
        addToWorkingsValue(value: ".")
    }
    
    @IBAction func seven(_ sender: Any) {
        addToWorkingsValue(value: "7")
    }
    
    @IBAction func eigth(_ sender: Any) {
        addToWorkingsValue(value: "8")
    }
    
    @IBAction func nine(_ sender: Any) {
        addToWorkingsValue(value: "9")
    }
    
    @IBAction func four(_ sender: Any) {
        addToWorkingsValue(value: "4")
    }
    
    @IBAction func five(_ sender: Any) {
        addToWorkingsValue(value: "5")
    }
    
    @IBAction func six(_ sender: Any) {
        addToWorkingsValue(value: "6")
    }
    
    @IBAction func one(_ sender: Any) {
        addToWorkingsValue(value: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        addToWorkingsValue(value: "2")
    }
    
    @IBAction func three(_ sender: Any) {
        addToWorkingsValue(value: "3")
    }
    
    @IBAction func zero(_ sender: Any) {
        addToWorkingsValue(value: "0")
    }
    
    @IBAction func equals(_ sender: Any) {
        if(validResult()){
            let formatedResultForPercent = workingsValue.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: formatedResultForPercent)
            let expressionResult = expression.expressionValue(with: nil, context: nil) as! Double
            let resultAtring = formatResult(result: expressionResult)
            result.text = resultAtring
        }else{
            let alert = UIAlertController(
                title: "Invalid input!",
                message: "The input that you type is not valid",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validResult() -> Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        let specialCharacters = ["+", "*", "/"]
        
        for char in workingsValue{
            if(specialCharacters.contains(String(char))){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous = -1
        
        for index in funcCharIndexes{
            if(index == 0){
                return false
            }
            if(index == workingsValue.count - 1){
                return false
            }
            if(previous > -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func formatResult (result: Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }else {
            return String(format: "%.2f", result)
        }
    }
}

