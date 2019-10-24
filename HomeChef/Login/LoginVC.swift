//
//  LoginVC.swift
//  HomeChef
//
//  Created by 2 Minut on 10/24/19.
//  Copyright © 2019 Hamza . All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
        
        if(validateFields()){
            performSegue(withIdentifier: "home", sender: nil)
        }
        
    }
    
    
    @IBAction func BackBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    //------- function to check if any field is empty or incorrect
    
    func validateFields() -> Bool{
        var  isValid = true
        
      
             if (Password.text!.isEmpty || (Password.text == " " )) {
         removeSpinner()
            showAlert("Error","Password cannot be empty")
            isValid = false
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
