//
//  Triangle.swift
//  LeanneKrivaa-Lab3
//
//  Created by Leanne Krivaa on 10/6/21.
//

import UIKit

class Triangle : Shape {
    public override func draw() {
        let temp = UIBezierPath()
        self.color.setFill()
        temp.move(to: CGPoint(x: self.origin.x ,y: self.origin.y))
        temp.addLine(to: CGPoint(x: self.origin.x - self.size ,y: self.origin.y + self.size*2))
        temp.addLine(to: CGPoint(x: self.origin.x + self.size ,y: self.origin.y + self.size*2))
        temp.close()
        temp.rotate(by: self.rotation)
        temp.fill()
        self.path = temp
    }
    
}
