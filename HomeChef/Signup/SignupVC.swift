//
//  SignupVC.swift
//  HomeChef
//
//  Created by Hamza on 10/24/19.
//  Copyright © 2019 Hamza . All rights reserved.
//

import UIKit
import Alamofire
import Reachability




class SignupVC: UIViewController {

    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var reachability:Reachability!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
  
    
    
    @IBAction func LoginBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "login", sender: nil)
    }
    
    
    private func apiCalling() -> Bool{
       var value : Bool = false
        do{
            self.reachability = try Reachability.init()
        }catch{
            print("Unable to start notifier")
        }
        if ((reachability!.connection != .none)){
            showSpinner()
            let parameters = [
                
                "name" : self.Name.text! as AnyObject,
                "mobile" : self.Phone.text! as AnyObject,
                "password" : self.Password.text! as AnyObject,
                "email" : self.Email.text! as AnyObject

            ]
            
            
            let encodeURL = apiSignup
            let requestofAPI = Alamofire.request(encodeURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            
            requestofAPI.responseJSON(completionHandler: { (response) -> Void in
              
               // print(response.request!)
               // print(response.result)
                //print(response.response as Any)
                
                
                switch response.result{
                    
                case .success(let payload):
                    self.removeSpinner()
                    
                    if let x = payload as? Dictionary<String,Any>{
                        print("this is x \(x["message"]!)")
                       // self.showAlert("Message", x["message"]! as! String)
                        
                        if(x["message"]! as! String == "User registered successfully"){
                            value = true
                        }
                    }
                    break
                case .failure(let error):
                    print("this is error \(error)")
                    self.removeSpinner()
                    self.showAlert("Error", error.localizedDescription)
                    value = false
                }
                

            })
            
             }else{
            let alert = UIAlertController(title: "Error", message: "Check your internet connection", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler:{action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil )
            
            
            
            
            
        }
        
        return value
          
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
  
    @IBAction func signUp(_ sender: Any) {
       
            
            if(validateFields()){
                
                if(apiCalling()){
                
                    self.showAlert("Successful", "Successfully Registered")
                performSegue(withIdentifier: "login", sender: nil)
                }
            }
            
        
        
    }
    
}
