//
//  Square.swift
//  LeanneKrivaa-Lab3
//
//  Created by Leanne Krivaa on 10/6/21.
//

import UIKit

class Square : Shape{    
    public override func draw() {
        self.color.set()
        let myShape = CGRect(x: self.origin.x , y: self.origin.y, width: self.size*2, height: self.size*2)
        let temp = UIBezierPath(rect: myShape)
        temp.rotate(by: self.rotation)
        temp.fill()
        self.path = temp
        
    }
    
}
