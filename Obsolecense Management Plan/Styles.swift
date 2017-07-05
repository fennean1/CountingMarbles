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
    
    func StyleAddBtn(container: CGRect) {
        
        var _frame: CGRect {
            
            let h = container.width/6
            let w = h
            let x = container.width -  h
            let y = CGFloat(0)
            
            return CGRect(x: x, y: y, width: w, height: h)
            
        }
        
        
        self.titleLabel?.font = UIFont(name: "ChalkBoard SE", size: 100)
        self.setTitle("+", for: .normal)
        self.setTitleColor(BLUE, for: .normal)
        self.frame = _frame
        
        
    }
    
    func StyleSubBtn(container: CGRect) {
        
        var _frame: CGRect {
            
            let h = container.width/6
            let w = h
            let x = CGFloat(0)
            let y = CGFloat(0)
            
            return CGRect(x: x, y: y, width: w, height: h)
            
        }
        
        
        self.titleLabel?.font = UIFont(name: "ChalkBoard SE", size: 100)
        self.setTitle("-", for: .normal)
        self.setTitleColor(UIColor.black, for: .normal)
        self.frame = _frame
        
        
    }
    
}
