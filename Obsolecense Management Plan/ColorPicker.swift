//
//  ColorPicker.swift
//  Obsolecense Management Plan
//
//  Created by Andrew Fenner on 6/25/17.
//  Copyright © 2017 Andrew Fenner. All rights reserved.
//

import Foundation
import UIKit



class colorbutton: UIButton {

    // Defult
    var type: UIImage!
    
    var active = false
    {
        didSet {
            
        
            let _x = self.center.x
            var _y = superview!.frame.height/4
            
            if active == true {
                
        
                    _y = 3*_y
                
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.center = CGPoint(x: _x, y: _y)
                    
                    
                })
                
           
            }
            else if active == false && oldValue == true {
                
                
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.center = CGPoint(x: _x, y: _y)
                    
                    
                })
    
            }
            else if active == true && oldValue == true
            {
                print("I Shouldn't Be Here")
            }

            
  
            }
            
        }
    }




extension CGSize
{
    
    mutating func expand(factor: CGFloat)
    {
        self.height = factor*self.height
        self.width = factor*self.height
        
    }
    
}


class colorpicker: UIView {
    
    
    
    var active: Bool {
        
        var _active = false
        
        for abutton in buttonArray {
            
            if abutton.active == true
            {
                _active = true
            }
            
        }
        
        return _active
        
    }
    
    
    var blueButton = colorbutton()

    var orangeButton = colorbutton()
    
    var purpleButton = colorbutton()

    var redButton = colorbutton()

    var greenButton = colorbutton()
  
    var pinkButton = colorbutton()
 
    var buttonArray: [colorbutton] = []
    

    func buttonPress(sender: colorbutton)
    {
     
        counterimage = sender.type
        
        
        // Obviously there's a better way to do this.
        switch sender.type {
            
        case BlueBall!:
            
            addBtn.setTitleColor(BLUE, for: .normal)
            
        case OrangeBall!:
        
            addBtn.setTitleColor(ORANGE, for: .normal)
            
        case PurpleBall!:
    
            addBtn.setTitleColor(PURPLE, for: .normal)
            
        case PinkBall!:
            
            addBtn.setTitleColor(PINK, for: .normal)
            
            
        case RedBall!:
            
            addBtn.setTitleColor(RED, for: .normal)
            
            
        case GreenBall!:
            
            addBtn.setTitleColor(GREEN, for: .normal)
            
        
        default:
            
            addBtn.setTitleColor(BLUE, for: .normal)
            
        }
        
        
        
        sender.active = !sender.active
        
        print(sender.active)
        
        for abutton in buttonArray
        {
            if abutton != sender
            {
                abutton.active = false
            }
        
        }
        
        colorSwitching = self.active
        
        
        
        
    }
    
    
    
    
    
    // Not drawing on init since I want to be able to control when the buttons get drawn
    func drawButtons()
    {
        
        let buttonStep = self.frame.width/6
        
        for (index, button) in buttonArray.enumerated()
        {
            
            let y = CGFloat(0)
            let x = CGFloat(index)*buttonStep
            
            let h = self.frame.height/2
            let w = h
            
            self.addSubview(button)
            
            button.frame =  CGRect(x: x, y: y, width: w, height: h)
            
        }
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Initialization Code
        
          blueButton.type = BlueBall
          blueButton.setImage(blueBtnImage, for: .normal)
        
          orangeButton.type = OrangeBall
        orangeButton.setImage(orangeBtnImage, for: .normal)
        
        
        
          purpleButton.type = PurpleBall
        purpleButton.setImage(purpleBtnImage, for: .normal)
        
        
        
          redButton.type = RedBall
        redButton.setImage(redBtnImage, for: .normal)
        
        
        
          greenButton.type = GreenBall
        greenButton.setImage(greenBtnImage, for: .normal)
        
        
        
          pinkButton.type = PinkBall
        pinkButton.setImage(pinkBtnImage, for: .normal)
        
        
        // self.backgroundColor = UIColor.blue
    
            blueButton.addTarget(self, action: #selector(colorpicker.buttonPress(sender:)), for: .touchUpInside)
             orangeButton.addTarget(self, action: #selector(colorpicker.buttonPress(sender:)), for: .touchUpInside)
             purpleButton.addTarget(self, action: #selector(colorpicker.buttonPress(sender:)), for: .touchUpInside)
             redButton.addTarget(self, action: #selector(colorpicker.buttonPress(sender:)), for: .touchUpInside)
             greenButton.addTarget(self, action: #selector(colorpicker.buttonPress(sender:)), for: .touchUpInside)
             pinkButton.addTarget(self, action: #selector(colorpicker.buttonPress(sender:)), for: .touchUpInside)
        
        
        
            buttonArray = [blueButton,orangeButton,purpleButton,redButton,greenButton,pinkButton]
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        
        
        fatalError("init(coder:) has not been implemented")
    
    
    }
    
    
    
}


extension UIView
{
    
    func colorpickerStyle(frame: CGRect)
    {
        
        let w = 0.6*frame.width
        let h = w/5
        
        let centerX = frame.width/2
        let centerY = h/2*1.8
        
        self.frame.size = CGSize(width: w, height: h)
        
        self.center = CGPoint(x: centerX, y: centerY)
        
    }
    
    
    
}
