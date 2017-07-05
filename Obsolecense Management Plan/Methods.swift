//
//  Helpers.swift
//  Obsolecense Management Plan
//
//  Created by Andrew Fenner on 4/19/17.
//  Copyright © 2017 Andrew Fenner. All rights reserved.
//

import Foundation
import UIKit

// Returns a cosine with type CGFloat for doing coordinate calculations
func cosine(arg: Double)-> CGFloat {
    
    return CGFloat(cos(arg))
    
}

// Give the ballsize as a function of the frame. Optimally set to an eighth of the width
func ballsize(frame: CGSize) -> CGSize {
    
    let h = frame.width/8
    let w = h
    
return CGSize(width: h, height: w)
    
}


// Offsets a particular point by another coordinate. Similar to adding function but only takes one argument for convenience.
extension CGPoint {
    
    mutating func offset(point: CGPoint) {
        
        let x = self.x - point.x
        let y = self.y - point.y
        
        self = CGPoint(x: x, y: y)
        
    }
    
}


// get the coordinates for placing two numbers inside of the view
func decompose(a:Int, b: Int,frame: CGSize) -> [CGPoint]
{
    
    var p: [CGPoint] = []
    
    let containerwidth = frame.width
    let containerheight = frame.height
    
    let ball = ballsize(frame: frame)
    
    
    let adim = getShapeCenterOffset(a: a, ballsize: ball.width)
    let bdim = getShapeCenterOffset(a: b, ballsize: ball.height)
    
    var aorigin = CGPoint(x: containerwidth/4, y: containerheight/2)
    aorigin.offset(point: adim)

    var borigin = CGPoint(x: 3*containerwidth/4, y: containerheight/2)
    borigin.offset(point: bdim)
    
    
    // Set of points for number 'a'
    let ap = numbershapeXY(a: a, frame: ball)
    // Adjusted points for number 'a'
    let adjap = ap.flatMap({C in addPoints(a: C, b: aorigin)})
    
    
    // Set of points for number 'b'
    let bp = numbershapeXY(a: b, frame: ball)
    // Adjusted points for number 'b'
    let adjbp = bp.flatMap({C in addPoints(a: C, b: borigin)})
    
    
    
    p = adjap + adjbp
    
    print(p,"This is P")
    
    return p
    
}




// Defines an operation that adds two points together
func addPoints(a: CGPoint,b: CGPoint) -> CGPoint {
    
    let ax = a.x
    let ay = a.y
    
    let bx = b.x
    let by = b.y
    
    return CGPoint(x: ax+bx,y: ay+by)
    
}


// Arranges any number for viewing within a frame (may consist of more than one numbershapes i.e. two digit numbers & compositions)
func numbershapeviewXY(a: Int, frame: CGSize)-> [CGPoint] {
    
    var c: [CGPoint] = []
    
    let ball = ballsize(frame: frame)
    
    switch a < 10 {
        
    case true:
    
    let shapeoffset = getShapeCenterOffset(a: a, ballsize: ball.width)
    
    print(shapeoffset,"SHAPEOFFSET")
    
    let shx = frame.width/2 - shapeoffset.x
    let shy = frame.height/2 - shapeoffset.y
    let offsetpoint = CGPoint(x: shx, y: shy)
 
    c = numbershapeXY(a: a, frame: ball)
    
    c = c.map({a in addPoints(a: a, b: offsetpoint)})
    
        
    case false:
        
    let o = a%10
    let t = a-o
        
    c = decompose(a: t, b: o, frame: frame)
    
    }
    
    return c
    
}





// Finds and array of centers for the pre-defined numbershapes in terms of value and ball size
func numbershapeXY(a: Int,frame: CGSize) -> [CGPoint] {
    
    var c: [CGPoint] = []
    let size = frame.width
    
    switch a {
        
    // Coordinates for One Ball
    case 1:
        
        // First Position
        let x1 = size/2
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
    // Coordinates for Two Balls
    case 2:
        
        let x1 = size/2
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
        let x2 = size/2
        let y2 = size/2 + size
        let point2 = CGPoint(x: x2,y: y2)
        c.append(point2)
        
    // Coordinates for Three Balls
    case 3:
        

        // Top Ball
        let x1 = size
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
        // Bottom Left
        let x2 = size/2
        let y2 = size/2 + size*COS30
        let point2 = CGPoint(x: x2,y: y2)
        c.append(point2)
        
        // Bottom Right
        let x3 = size + size/2
        let y3 = size/2 + size*COS30
        let point3 = CGPoint(x: x3,y: y3)
        c.append(point3)
        
        
    case 4:
        
        // Top Left
        let x1 = size/2
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
        // Top Right
        let x2 = size/2 + size
        let y2 = size/2
        let point2 = CGPoint(x: x2,y: y2)
        c.append(point2)
        
        // Bottom Left
        let x3 = size/2
        let y3 = size/2 + size
        let point3 = CGPoint(x: x3,y: y3)
        c.append(point3)
        
        // Bottom Right
        let x4 = size/2 + size
        let y4 = size/2 + size
        let point4 = CGPoint(x: x4,y: y4)
        c.append(point4)
        
    case 5:
        
        let containerwidth = size+2*size*COS45
        
        // Top Left
        let x1 = size/2
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
        // Top Right
        let x2 = containerwidth - size/2
        let y2 = size/2
        let point2 = CGPoint(x: x2,y: y2)
        c.append(point2)
        
        // Middle
        let x3 = containerwidth/2
        let y3 = containerwidth/2
        let point3 = CGPoint(x: x3,y: y3)
        c.append(point3)
        
        // Bottom Left
        let x4 = size/2
        let y4 = containerwidth-size/2
        let point4 = CGPoint(x: x4,y: y4)
        c.append(point4)
        
        // Bottom right
        let x5 = containerwidth-size/2
        let y5 = containerwidth-size/2
        let point5 = CGPoint(x: x5,y: y5)
        c.append(point5)
        
    case 6:
        
        // Top Left
        let x1 = size/2
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
        // Top Right
        let x2 = size/2 + size
        let y2 = size/2
        let point2 = CGPoint(x: x2,y: y2)
        c.append(point2)
        
        // Middle Left
        let x3 = size/2
        let y3 = size/2 + size
        let point3 = CGPoint(x: x3,y: y3)
        c.append(point3)
        
        // Middle Right
        let x4 = size/2 + size
        let y4 = size/2 + size
        let point4 = CGPoint(x: x4,y: y4)
        c.append(point4)
        
        // Bottom Left
        let x5 = size/2
        let y5 = size/2 + 2*size
        let point5 = CGPoint(x: x5,y: y5)
        c.append(point5)
        
        // Bottom Right
        let x6 = size/2 + size
        let y6 = size/2 + 2*size
        let point6 = CGPoint(x: x6,y: y6)
        c.append(point6)
        
        
    // Coordinates for 7 balls
    case 7:
        
        
        // Top Left Ball
        let x1 = size
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
        // Top Left Ball
        let x2 = 2*size
        let y2 = size/2
        let point2 = CGPoint(x: x2,y: y2)
        c.append(point2)
        
        // Bottom Left
        let x3 = size/2
        let y3 = size/2 + size*COS30
        let point3 = CGPoint(x: x3,y: y3)
        c.append(point3)
        
        // Bottom Middle
        let x4 = size + size/2
        let y4 = size/2 + size*COS30
        let point4 = CGPoint(x: x4,y: y4)
        c.append(point4)
        
        // Bottom Right
        let x5 = 2*size + size/2
        let y5 = size/2 + size*COS30
        let point5 = CGPoint(x: x5,y: y5)
        c.append(point5)
        
        // Bottom Left
        let x6 = size
        let y6 = size/2 + 2*size*COS30
        let point6 = CGPoint(x: x6,y: y6)
        c.append(point6)
        
        // Bottom Left
        let x7 = 2*size
        let y7 = size/2 + 2*size*COS30
        let point7 = CGPoint(x: x7,y: y7)
        c.append(point7)
        
        
    case 8:
        
        // Top Left
        let x1 = size/2
        let y1 = size/2
        let point1 = CGPoint(x: x1, y: y1)
        c.append(point1)
        
        // Top Left
        let x2 = size/2 + size
        let y2 = size/2
        let point2 = CGPoint(x: x2, y: y2)
        c.append(point2)
        
        // Top Left
        let x3 = size/2 + 2*size
        let y3 = size/2
        let point3 = CGPoint(x: x3, y: y3)
        c.append(point3)
        
        // Middle left
        let x4 = size
        let y4 = size/2 + size*COS30
        let point4 = CGPoint(x: x4, y: y4)
        c.append(point4)
        
        // Middle right
        let x5 = 2*size
        let y5 = size/2 + size*COS30
        let point5 = CGPoint(x: x5, y: y5)
        c.append(point5)
        
        // Top Left
        let x6 = size/2
        let y6 = size/2 + 2*size*COS30
        let point6 = CGPoint(x: x6, y: y6)
        c.append(point6)
        
        // Top Left
        let x7 = size/2 + size
        let y7 = size/2 + 2*size*COS30
        let point7 = CGPoint(x: x7, y: y7)
        c.append(point7)
        
        // Top Left
        let x8 = size/2 + 2*size
        let y8 = size/2 + 2*size*COS30
        let point8 = CGPoint(x: x8, y: y8)
        c.append(point8)
        
    case 9:
        
        // Top Left
        let x1 = size/2
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
        // Top Middle
        let x2 = size/2 + size
        let y2 = size/2
        let point2 = CGPoint(x: x2,y: y2)
        c.append(point2)
        
        // Top Right
        let x3 = size/2 + 2*size
        let y3 = size/2
        let point3 = CGPoint(x: x3,y: y3)
        c.append(point3)
        
        // Middle Left
        let x4 = size/2
        let y4 = size/2 + size
        let point4 = CGPoint(x: x4,y: y4)
        c.append(point4)
        
        // Middle Middle
        let x5 = size/2 + size
        let y5 = size/2 + size
        let point5 = CGPoint(x: x5,y: y5)
        c.append(point5)
        
        // Middle Right
        let x6 = size/2 + 2*size
        let y6 = size/2 + size
        let point6 = CGPoint(x: x6,y: y6)
        c.append(point6)
        
        // Bottom Left
        let x7 = size/2
        let y7 = size/2 + 2*size
        let point7 = CGPoint(x: x7,y: y7)
        c.append(point7)
        
        // Bottom Middle
        let x8 = size/2 + 2*size
        let y8 = size/2 + 2*size
        let point8 = CGPoint(x: x8,y: y8)
        c.append(point8)
        
        // Bottom Right
        let x9 = size/2 + size
        let y9 = size/2 + 2*size
        let point9 = CGPoint(x: x9,y: y9)
        c.append(point9)
        
        
    case 10:
        
        // Top
        let x1 = 2*size
        let y1 = size/2
        let point1 = CGPoint(x: x1,y: y1)
        c.append(point1)
        
        // Second row_1
        let x2 = size + size/2
        let y2 = size/2 + size*COS30
        let point2 = CGPoint(x: x2,y: y2)
        c.append(point2)
        
        // Second row_2
        let x3 = 2*size + size/2
        let y3 = size/2 + size*COS30
        let point3 = CGPoint(x: x3,y: y3)
        c.append(point3)
        
        // Third row_1
        let x4 = size
        let y4 = size/2 + 2*size*COS30
        let point4 = CGPoint(x: x4,y: y4)
        c.append(point4)
        
        // Third row_2
        let x5 = 2*size
        let y5 = size/2 + 2*size*COS30
        let point5 = CGPoint(x: x5,y: y5)
        c.append(point5)
        
        // Third row_3
        let x6 = 3*size
        let y6 = size/2 + 2*size*COS30
        let point6 = CGPoint(x: x6,y: y6)
        c.append(point6)
        
        // Fourth row_1
        let x7 = size/2
        let y7 = size/2 + 3*size*COS30
        let point7 = CGPoint(x: x7,y: y7)
        c.append(point7)
        
        // Fourth row_2
        let x8 = size/2 + size
        let y8 = size/2 + 3*size*COS30
        let point8 = CGPoint(x: x8,y: y8)
        c.append(point8)
        
        // Fourth row_3
        let x9 = size/2 + 2*size
        let y9 = size/2 + 3*size*COS30
        let point9 = CGPoint(x: x9,y: y9)
        c.append(point9)
        
        
        // Fourth row_4
        let x10 = size/2 + 3*size
        let y10 = size/2 + 3*size*COS30
        let point10 = CGPoint(x: x10,y: y10)
        c.append(point10)
        
        
    default:
        
        print("This number was not found in the coordinates cases")
        
    }
    
    return c
    
}





// Gets the width and height of any numbershape based on the number and the ballsize
func getShapeCenterOffset(a: Int, ballsize: CGFloat)-> CGPoint {
    
    var size: CGSize!
    
    switch a {
        
    case 1:
        
        size = CGSize(width: ballsize, height: ballsize)
        
    case 2:
        
        let w = ballsize
        let h = 2*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 3:
        
        let h = 2*ballsize*COS30
        let w = 2*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 4:
        
        let h = 2*ballsize
        let w = 2*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 5:
        
        let h = ballsize+2*ballsize*COS45
        let w = ballsize+2*ballsize*COS45
        
        size = CGSize(width: w, height: h)
        
        
    case 6:
        
        let h = 3*ballsize
        let w = 2*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 7:
        
        let h = 2*ballsize*COS30+ballsize
        let w = 3*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 8:
        
        let h = 2*ballsize*COS30+ballsize
        let w = 3*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 9:
        
        let h = 3*ballsize
        let w = 3*ballsize
        
        size = CGSize(width: w, height: h)
        
        
    case 10:
        
        let h = ballsize + 3*ballsize*COS30
        let w = 4*ballsize
        
        size = CGSize(width: w, height: h)
        
        
    default:
        
        print("didn't find anything")
        size = CGSize(width: 0, height: 0)
        
    }
    
    
    return CGPoint(x: size.width/2, y: size.height/2)
    
}





// Gets the width and height of any numbershape based on the number and the ballsize
func getShapeDimensions(a: Int, ballsize: CGFloat)-> CGSize {
    
    var size: CGSize!
    
    switch a {
        
    case 1:
    
        size = CGSize(width: ballsize, height: ballsize)
        
    case 2:
        
        let w = ballsize
        let h = 2*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 3:
        
        let h = 2*ballsize*COS30
        let w = 2*ballsize
        
        size = CGSize(width: w, height: h)
    
    case 4:
    
        let h = 2*ballsize
        let w = 2*ballsize
    
        size = CGSize(width: w, height: h)
     
    case 5:
        
        let h = ballsize+2*ballsize*COS45
        let w = ballsize+2*ballsize*COS45
        
        size = CGSize(width: w, height: h)
    
        
    case 6:
        
        let h = 3*ballsize
        let w = 2*ballsize
        
        size = CGSize(width: w, height: h)
       
    case 7:
        
        let h = 2*ballsize*COS30+ballsize
        let w = 3*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 8:
        
        let h = 2*ballsize*COS30+ballsize
        let w = 3*ballsize
        
        size = CGSize(width: w, height: h)
        
    case 9:
        
        let h = 3*ballsize
        let w = 3*ballsize
        
        size = CGSize(width: w, height: h)
        
        
    case 10:
        
        let h = ballsize + 3*ballsize*COS30
        let w = 4*ballsize
        
        size = CGSize(width: w, height: h)
        
        
    default:
     
        print("didn't find anything")
        size = CGSize(width: 0, height: 0)
        
    }
    
    
    return size
    
}
