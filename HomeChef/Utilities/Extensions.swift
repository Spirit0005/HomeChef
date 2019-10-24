//
//  Extensions.swift
//  HomeChef
//
//  Created by 2 Minut on 10/24/19.
//  Copyright © 2019 Hamza . All rights reserved.
//

import Foundation
import UIKit

var aView:UIView?


extension UIViewController{
    
    //------- function to show spinner
        
        func showSpinner(){
            
            aView = UIView(frame: self.view.bounds)
            aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            
            let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.center = aView!.center
            activityIndicator.startAnimating()
            aView?.addSubview(activityIndicator)
            self.view.addSubview(aView!)
            
        }
        
    //------ remove spinner function
        
         func removeSpinner(){
         
            aView?.removeFromSuperview()
            aView = nil
            
        }
        
    //------- Auto hide keyboard function
        
        func hideKeyboard() {
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    //------ Custom Alert
    
    func showAlert(_ title: String, _ message: String) {
          
          let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
          
          let alertSimple = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
          
          alertSimple.addAction(okAction)
          
          self.present(alertSimple, animated: true, completion: nil)
          
      }
}


//------ extension of strign class

extension String {
    
//----- function to validate email address
    
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
//----- function to check phone length
    
    func isValidPhoneWithLength() -> Bool {
        return (self.count == 10 || self.count == 11 ) ? true : false
    }
    
    
}


