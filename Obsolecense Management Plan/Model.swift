//
//  Modle.swift
//  Obsolecense Management Plan
//
//  Created by Andrew Fenner on 4/18/17.
//  Copyright © 2017 Andrew Fenner. All rights reserved.
//

import Foundation
import UIKit

// Convenience:


var Balls: [touchableBall] = []

var BallsInPlay = 14

// UIElements

var addBtn = UIButton()
var subBtn = UIButton()

var BallDim: CGFloat = 0

// Initialize counter
var counter = UIImage(named: "PurpleBall")

var centerOfScreen: CGPoint!

let BallArray = [BlueBall,OrangeBall,RedBall,GreenBall,PinkBall,PurpleBall]


var colorSwitching = false

var Split = false

var counterimage = BlueBall

var originalCoordinates: [CGPoint] = []

var numbershapeViewOrigin: CGPoint!

var a = 10
var b = 4

var Scattered = false


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

var NumberShapeFrame: CGRect!

// Ball Radius
var r: CGFloat!

//// Animations
let animationSpeed = 0.5


