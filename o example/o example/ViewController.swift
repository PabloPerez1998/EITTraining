//
//  ViewController.swift
//  o example
//
//  Created by Consultant on 7/11/22.
//

import UIKit

class ViewController: UIViewController, CardIOPaymentViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        CardIOUtilities.preload()
    }

    @IBAction func scanButtonClicked(_ sender: Any) {
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC?.collectCardholderName = true
        cardIOVC?.hideCardIOLogo = true
        cardIOVC?.guideColor = UIColor.red
        cardIOVC?.collectCVV = true
        present((cardIOVC)!, animated: true)
        
    }
    
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        print("User has canceled the scanner.")
        paymentViewController.dismiss(animated: true)
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        if let info = cardInfo {
            let str = NSString(format: "Received card info.\n Cardholders Name: %@ \n Number: %@\n expiry: %02lu/%lu\n cvv: %@.", info.cardholderName, info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv)
             print(str as String)
        }
        
        paymentViewController.dismiss(animated: true)
    }

    
}



