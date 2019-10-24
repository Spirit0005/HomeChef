//
//  LoginVC.swift
//  HomeChef
//
//  Created by Hamza on 10/24/19.
//  Copyright © 2019 Hamza . All rights reserved.
//

import UIKit
import Reachability
import Alamofire

class LoginVC: UIViewController {

    
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    var reachability:Reachability!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
                
                
                "mobile" : self.Phone.text! as AnyObject,
                "password" : self.Password.text! as AnyObject,
              
                
            ]
            
            
            let encodeURL = apiLogin
            let requestofAPI = Alamofire.request(encodeURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            
            requestofAPI.responseJSON(completionHandler: { (response) -> Void in
                
                print(response.request!)
                print(response.result)
                print(response.response as Any)
                
                
                switch response.result{
                    
                case .success(let payload):
                    self.removeSpinner()
                    if let x = payload as? Dictionary<String,Any>{
                        print("this is x \(x)")
                      
                      //  self.showAlert("Message", x.description)
                        value = true
                    }
                    break
                case .failure(let error):
                    print("this is error \(error)")
                    self.showAlert("Error", error as! String)
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
    @IBAction func LoginBtn(_ sender: Any) {
        
        if(validateFields()){
            if (apiCalling()){
            performSegue(withIdentifier: "home", sender: nil)
            }
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
