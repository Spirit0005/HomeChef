//
//  SignupVC.swift
//  HomeChef
//
//  Created by 2 Minut on 10/24/19.
//  Copyright © 2019 Hamza . All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func SignupBtn(_ sender: Any) {
        
        if(validateFields()){
            
            
                  performSegue(withIdentifier: "home", sender: nil)
              }
              
    }
    
    
    @IBAction func LoginBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    
    func apiCalling(){
          
    }
    
    
    
    
    //------- function to check if any field is empty or incorrect
       
       func validateFields() -> Bool{
           var  isValid = true
           
           if (Email.text!.isEmpty || (Email.text == " " )) {
            removeSpinner()
               showAlert("Error","Email cannot be empty")
               return false
           }else{
               if ((Email.text?.isValidEmail())!) {
                   isValid = true
               }else{
                removeSpinner()
                   showAlert("Error","Please input a valid email address")

                    return false
               }
           }
        
        
           if (Password.text!.isEmpty || (Password.text == " " )) {
            removeSpinner()
               showAlert("Error","Password cannot be empty")
               isValid = false
           }else{
                          isValid = true
               
           }
        
        
           if (Name.text!.isEmpty || (Name.text == " " )) {
            removeSpinner()
               showAlert("Error","Please enter your name")
               return false
               }else{
               isValid = true
                  }
       
        if (Phone.text!.isEmpty || (Phone.text == " " )) {
         removeSpinner()
            showAlert("Error","Phone cannot be empty")
            isValid = false
        }else{
            if (Phone.text!.isValidPhoneWithLength()) {
                       isValid = true
            }else{
             removeSpinner()
                showAlert("Error","Phone Number must be either 10 or 11 characters")
                    return false
                   }
        }
           
           return isValid
       }
  
}
