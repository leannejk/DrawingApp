//
//  Circle.swift
//  LeanneKrivaa-Lab3
//
//  Created by Leanne Krivaa on 10/6/21.
//

import UIKit

class Circle : Shape {    
    public override func draw() {
        self.color.set()
        let temp = UIBezierPath ()
        temp.addArc(withCenter: self.origin, radius: self.size    , startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        temp.rotate(by: self.rotation)
        temp.fill()
        self.path = temp
        
    }
    
}
