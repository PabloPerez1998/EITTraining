import UIKit

let greeting = "()[]{}"

print(checkIfValid(string:greeting))

func checkIfValid(string: String) -> Bool{
    let openingCharacters = ["[", "{", "("]
    let closingCharacters = ["]", "}", ")"]
    for i in (0..<greeting.count){
        let char = String(greeting[greeting.index(greeting.startIndex, offsetBy: i)])
        let openIndex = openingCharacters.firstIndex(of: char)
        let closeIndex = closingCharacters.firstIndex(of: char)
        if(openIndex != nil){
            let char2 = String(greeting[greeting.index(greeting.startIndex, offsetBy: i + 1)])
            if(String(closingCharacters[openIndex!]) != char2){
                return false
            }
        }else if(closeIndex != nil && i > 0){
            let char2 = String(greeting[greeting.index(greeting.startIndex, offsetBy: i - 1)])
            if(String(openingCharacters[closeIndex!]) != char2){
                return false
            }
        }else{
            return false
        }
    }
    return true
}



