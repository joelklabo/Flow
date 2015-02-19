//
//  PushButtonView.swift
//  Flow
//
//  Created by Joel Klabo on 2/18/15.
//  Copyright (c) 2015 Joel Klabo. All rights reserved.
//

import UIKit

@IBDesignable

class PushButtonView: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    @IBInspectable var isAddButton: Bool = true

    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        fillColor.setFill()
        path.fill()
        
        // set up the width and height variables
        // for the horizontal stroke
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = 45.0
        
        // create the path
        var plusPath = UIBezierPath()
        
        // set the path's line width to the height of the stroke
        plusPath.lineWidth = plusHeight
        
        // move the initial point of the path 
        // to the start of the horizontal stroke
        plusPath.moveToPoint(CGPoint(x: bounds.width / 2 - plusWidth / 2 + 0.5, y: bounds.height / 2 + 0.5))
        
        // add a point to the path at the end of the stroke
        plusPath.addLineToPoint(CGPoint(x: bounds.width / 2 + plusWidth / 2 + 0.5, y: bounds.height / 2 + 0.5))
        
        // set the stroke color
        UIColor.whiteColor().setStroke()
        
        if (isAddButton) {
            // move to the initial point of the vertical stroke
            plusPath.moveToPoint(CGPoint(x: bounds.width / 2 + 0.5, y: bounds.height / 2 + 0.5 - plusWidth / 2))
            
            plusPath.addLineToPoint(CGPoint(x: bounds.width / 2 + 0.5, y: bounds.height / 2 + 0.5 + plusWidth / 2))
        }
        
        
        // draw the stroke
        plusPath.stroke()
    }

}
