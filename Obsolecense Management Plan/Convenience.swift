//
//  Convenience.swift
//  Counting Marbles
//
//  Created by Andrew Fenner on 7/1/17.
//  Copyright © 2017 Andrew Fenner. All rights reserved.
//

import Foundation
import UIKit


let BlueBall = UIImage(named: "BlueBall")
let OrangeBall = UIImage(named: "OrangeBall")
let RedBall = UIImage(named: "RedBall")
let GreenBall = UIImage(named: "GreenBall")
let PinkBall = UIImage(named: "PinkBall")
let PurpleBall = UIImage(named: "PurpleBall")

let purpleBtnImage = UIImage(named: "PurpleThumbPrint")
let pinkBtnImage = UIImage(named: "PinkThumbPrint")
let redBtnImage = UIImage(named: "RedThumbPrint")
let orangeBtnImage = UIImage(named: "OrangeThumbPrint")
let greenBtnImage = UIImage(named: "GreenThumbPrint")
let blueBtnImage = UIImage(named: "BlueThumbPrint")



extension Int
{
    mutating func ColorValue() -> CGFloat
    {
        return CGFloat(self/255)
    }
    
}

// Pre - Set Colors

func rgbColor(Red: Int,Green: Int, Blue: Int, Alpha: CGFloat) -> UIColor
{
    
    return UIColor(red: CGFloat(Red/255) ,green: CGFloat(Green/255),blue: CGFloat(Blue/255) ,alpha: Alpha)
    
}

let ORANGE = UIColor(red: 1, green: 0.6627, blue: 0.3294, alpha: 1.0)

let BLUE = UIColor(red: 0.1176, green: 0.3961, blue: 1, alpha: 1.0)

let RED = UIColor(red: 0.9373, green: 0.0902, blue: 0.0902, alpha: 1.0)

let GREEN = UIColor(red: 0.102, green: 0.9176, blue: 0.0902, alpha: 1.0)

let PURPLE = UIColor(red: 0.7373, green: 0.3098, blue: 0.949, alpha: 1.0)

let PINK = UIColor(red: 1, green: 0.1176, blue: 0.8824, alpha: 1.0)


