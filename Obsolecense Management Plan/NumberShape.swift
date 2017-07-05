
//
//  File.swift
//  Obsolecense Management Plan
//
//  Created by Andrew Fenner on 4/18/17.
//  Copyright © 2017 Andrew Fenner. All rights reserved.
//n

import Foundation
import UIKit




// A view for representing numbershapes. **Always init with width = 2 X Height**
class numbershapeview: UIView {
    
    // Images views of balls currently on the card (initially zero)
    var balls: [UIImageView] = []
    
    // Calculates the preferred ballsize based on the current dimensions of the view
    var ballheight: CGFloat{return self.frame.width/8}
    
    // pass this a set of coordinates that you want to animate to (must initialize first)
    func animateto(coordinates: [CGPoint]){
        
        // Number of balls currently on the card
        let ballsinplay = balls.count
        let coordinatesinplay = coordinates.count
        
        
        let localballsize = CGSize(width: ballheight, height: ballheight)
        
        
        // Logic for adding or removing objects when the number of coordinates have changed. If we received more coordinates that there are balls on the board, we need to add more.
        if coordinatesinplay > ballsinplay {
            
            for _ in 0...coordinatesinplay-ballsinplay-1 {
                
                
                // CHANGE THIS TO ALTER THE IMAGE USED
                let newball = UIImageView(image: BlueBall)
                
                self.addSubview(newball)
                
                newball.frame = CGRect(origin: CGPoint(x:0,y:0), size: localballsize)
                
                balls.append(newball)
            }
            
        }
            // if we have fewer coordinates than we do balls, we must remove objects
        else if coordinatesinplay < ballsinplay {
            
            // Difference equals the number of balls to remove
            let numbertoremove = ballsinplay - coordinatesinplay
            
            for _ in 1...numbertoremove {
                
                balls[0].removeFromSuperview()
                balls.remove(at: 0)
                
            }
            
        }
        
        // Finally, animate to the new coordinates.
        UIView.animate(withDuration: 2, animations:{
            
            for index in 0...coordinates.count-1 {
                
                self.balls[index].center = coordinates[index]
                
            }
            
        })
        
    }
    
}


