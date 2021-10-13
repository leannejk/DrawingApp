//
//  UIBezierPath+Rotate.swift
//  LeanneKrivaa-Lab3
//
//  Created by Leanne Krivaa on 10/8/21.
//

import UIKit

extension UIBezierPath {
    func rotate(by angleRadians: CGFloat){
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: center.x, y: center.y)
        transform = transform.rotated(by: angleRadians)
        transform = transform.translatedBy(x: -center.x, y: -center.y)
        self.apply(transform)
        
    }
    
}

