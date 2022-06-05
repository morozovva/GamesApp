//
//  RocketViewExtension.swift
//  GamesApp
//
//  Created by xyz mac on 21.04.2022.
//

import UIKit

extension UIView {
    
    func animationOfShaking() {
        let shake = CASpringAnimation(keyPath: "position")
        let fromValue = NSValue(cgPoint: CGPoint(x: frame.width/2 - 7, y: 448))
        let toValue = NSValue(cgPoint: CGPoint(x: frame.width/2 + 7, y: 448))
        shake.duration = 0.1
        shake.repeatCount = 3
        shake.autoreverses = true
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: nil)
    }
    
    func animationOfFlying() {
        let theAnimation = CABasicAnimation(keyPath: "position.y");
        theAnimation.fromValue = NSValue(cgPoint: CGPoint(x: frame.width/2, y: frame.maxY+300))
        theAnimation.toValue = 0
        theAnimation.duration = 1
        theAnimation.autoreverses = false
        theAnimation.repeatCount = 0
        theAnimation.beginTime = CACurrentMediaTime() + 0.7
        
        let heightAnimation = CABasicAnimation(keyPath: "transform.scale")
        heightAnimation.duration = 1
        heightAnimation.fromValue = 1
        heightAnimation.toValue = 0
        heightAnimation.autoreverses = false
        heightAnimation.beginTime = CACurrentMediaTime() + 0.7
        
        layer.add(theAnimation, forKey: nil)
        layer.add(heightAnimation, forKey: nil)
    }
}
