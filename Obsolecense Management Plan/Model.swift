//
//  Modle.swift
//  Obsolecense Management Plan
//
//  Created by Andrew Fenner on 4/18/17.
//  Copyright © 2017 Andrew Fenner. All rights reserved.
//

import Foundation
import UIKit


//// Assets


// Initialize counter
var counter = UIImage(named: "PurpleBall")


let BallArray = [BlueBall,OrangeBall,RedBall,GreenBall,PinkBall,PurpleBall]


let BlueBall = UIImage(named: "BlueBall")
let OrangeBall = UIImage(named: "OrangeBall")
let RedBall = UIImage(named: "RedBall")
let GreenBall = UIImage(named: "GreenBall")
let PinkBall = UIImage(named: "PinkBall")
let PurpleBall = UIImage(named: "PurpleBall")


//// Math



var originalCoordinates: [CGPoint] = []

var numbershapeViewOrigin: CGPoint!

// For convenience invoking common trig ratios.
let COS30 = cosine(arg: Double.pi/6)
let COS45 = cosine(arg: Double.pi/4)


//// Functions

// Returns a cosine with type CGFloat for doing coordinate calculations
func cosine(arg: Double)-> CGFloat {
    
    return CGFloat(cos(arg))
    
}

// Give the ballsize as a function of the frame. Optimally set to an eighth of the width
func ballsize(frame: CGSize) -> CGSize {
    
    let h = frame.height/5
    let w = h
    
    return CGSize(width: h, height: w)
    
}



//// Animations
let animationSpeed = 0.5


