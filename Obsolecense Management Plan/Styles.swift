//
//  styles.swift
//  Obsolecense Management Plan
//
//  Created by Andrew Fenner on 6/28/17.
//  Copyright © 2017 Andrew Fenner. All rights reserved.
//

import Foundation
import UIKit



extension UIButton {
    
    func operatorBtnStyle(PlusMinus: String) {
        
        self.titleLabel?.font = UIFont(name: "ChalkBoard SE", size: 20)
        self.titleLabel?.textColor = UIColor.blue
        self.setTitle(PlusMinus, for: .normal)
        
    }
    
}
