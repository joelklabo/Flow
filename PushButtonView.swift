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

    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        UIColor.blueColor().setFill()
        path.fill()
    }

}
