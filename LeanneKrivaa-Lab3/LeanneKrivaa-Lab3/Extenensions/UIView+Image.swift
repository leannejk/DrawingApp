//
//  UIView+Image.swift
//  LeanneKrivaa-Lab3
//
//  Created by Leanne Krivaa on 10/8/21.
//

import UIKit

extension UIView {

    //from:stackoverflow.com/questions/30696307/how-to-convert-a-uiview-to-an-image
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
