//
//  CounterView.swift
//  Flow
//
//  Created by Joel Klabo on 2/19/15.
//  Copyright (c) 2015 Joel Klabo. All rights reserved.
//

import UIKit

let NoOfGlasses = 8
let π: CGFloat = CGFloat(M_PI)

@IBDesignable

class CounterView: UIView {

    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= NoOfGlasses {
                // the view needs to be updated
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    override func drawRect(rect: CGRect) {
        
        // 1
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        // 2
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // 3
        let arcWidth: CGFloat = 76
        
        // 4
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        
        // 5
        var path = UIBezierPath(arcCenter: center, radius: bounds.width/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        // 6
        path.lineWidth = arcWidth
        path.lineCapStyle = kCGLineCapButt
        counterColor.setStroke()
        path.stroke()
        
        // Draw the outline
        
        // 1 - First calculate the difference between the two angles
        // ensuring it is positive
        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        
        // then calculate the arc for each single class
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
        
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        // draw the outer arc
        var outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        // draw the inner arc
        outlinePath.addArcWithCenter(center, radius: bounds.width/2 - arcWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        // close the path
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
    }

}
