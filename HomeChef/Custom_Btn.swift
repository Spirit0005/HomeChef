//
//  Custom_Btn.swift
//  HomeChef
//
//  Created by Hamza  on 24/10/2019.
//  Copyright © 2019 Hamza . All rights reserved.
//

import UIKit
@IBDesignable

class Custom_Btn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
        
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    func customizeView(){
        
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        
    }

}
