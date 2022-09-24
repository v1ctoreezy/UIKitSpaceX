//
//  Rectangle.swift
//  UIKitSpaceX
//
//  Created by Виктор Черкасов on 16.08.2022.
//

import UIKit

class Rectangle: UIView {
    func drawRectangle()
    {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth( 5.0)
        UIColor.red.set()
        context?.addRect( CGRect(x: 0, y: 0, width: 100, height: 100))
        context?.strokePath()

    }
    
    
}
