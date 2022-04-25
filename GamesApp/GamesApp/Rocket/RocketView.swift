//
//  RocketView.swift
//  GamesApp
//
//  Created by xyz mac on 21.04.2022.
//

import UIKit

final class RocketView: UIView {
    
    private lazy var rocketView : UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return view
    }()
    
    private lazy var shakerButton: UIButton = {
            let button = UIButton()
            button.setTitle("Press", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
        button.frame = CGRect(x: safeAreaInsets.left + 55,
                              y: safeAreaInsets.top + 70,
                                            width: 70,
                                            height: 48)
            button.addAction(UIAction { [weak self] _ in
                self?.shakerButtonDidTouchDown()
            }, for: .touchDown)
        button.addAction(UIAction { [weak self] _ in
            self?.moveButtonDidTouchDown()
        }, for: .touchDown)
            return button
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        addSubview(rocketView)
        addSubview(shakerButton)
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    
    convenience init() {
        self.init(frame: .zero)
    }
}

private extension RocketView {
    
    private func setup() {
        let body = getBodyShape()
        let window = getWindowShape()
        let left = getLeftThing()
        let right = getRightThing()
        let fire = getFireThing()
        
        rocketView.layer.addSublayer(body)
        rocketView.layer.addSublayer(window)
        rocketView.layer.addSublayer(left)
        rocketView.layer.addSublayer(right)
        rocketView.layer.addSublayer(fire)
    }
    
    private func shakerButtonDidTouchDown() {
        rocketView.animationOfShaking()
    }
    
    private func moveButtonDidTouchDown(){
        rocketView.animationOfFlying()
    }
    
    private func getBodyShape() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 154, y: 774))
        path.addQuadCurve(to: CGPoint(x: 204, y: 601), controlPoint: CGPoint(x: 135, y: 687))
        path.addQuadCurve(to: CGPoint(x: 250, y: 774), controlPoint: CGPoint(x: 270, y: 687))
        path.close()
        let bodyShape = CAShapeLayer()
        bodyShape.path = path.cgPath
        bodyShape.lineWidth = 5
        bodyShape.strokeColor = UIColor.black.cgColor
        bodyShape.fillColor =  UIColor.black.cgColor
        return bodyShape
    }

    private func getWindowShape() -> CAShapeLayer {
        let windowPath = UIBezierPath(arcCenter: CGPoint(x: 202, y: 676), radius: CGFloat(27), startAngle: CGFloat(0), endAngle: CGFloat(Double.pi * 2), clockwise: true)
        let windowShape = CAShapeLayer()
        windowShape.path = windowPath.cgPath
        windowShape.strokeColor = UIColor.black.cgColor
        windowShape.lineWidth = 4
        windowShape.fillColor =  UIColor.white.cgColor
        return windowShape
    }

    private func getLeftThing() -> CAShapeLayer {
        let leftPath = UIBezierPath()
        leftPath.move(to: CGPoint(x: 171, y: 729))
        leftPath.addLine(to: CGPoint(x: 171, y: 807))
        leftPath.addLine(to: CGPoint(x: 131, y: 827))
        leftPath.addLine(to: CGPoint(x: 131, y: 749))
        leftPath.addLine(to: CGPoint(x: 171, y: 729))
                   
        let leftShape = CAShapeLayer()
        leftShape.path = leftPath.cgPath
        leftShape.lineWidth = 5
        leftShape.strokeColor = UIColor.black.cgColor
        leftShape.fillColor =  UIColor.black.cgColor
        return leftShape
    }

    private func getRightThing() -> CAShapeLayer {
        let rightPath = UIBezierPath()
        rightPath.move(to: CGPoint(x: 231, y: 729))
        rightPath.addLine(to: CGPoint(x: 231, y: 807))
        rightPath.addLine(to: CGPoint(x: 271, y: 827))
        rightPath.addLine(to: CGPoint(x: 271, y: 749))
        rightPath.addLine(to: CGPoint(x: 231, y: 729))
                   
        let rightShape = CAShapeLayer()
        rightShape.path = rightPath.cgPath
        rightShape.lineWidth = 5
        rightShape.strokeColor = UIColor.black.cgColor
        rightShape.fillColor =  UIColor.black.cgColor
        return rightShape
    }

    private func getFireThing() -> CAShapeLayer {
        let firePath = UIBezierPath()
        firePath.move(to: CGPoint(x: 180, y: 790))
        firePath.addLine(to: CGPoint(x: 220, y: 790))
        firePath.addLine(to: CGPoint(x: 200, y: 850))
        firePath.addLine(to: CGPoint(x: 180, y: 790))
                   
        let fireShape = CAShapeLayer()
        fireShape.path = firePath.cgPath
        fireShape.lineWidth = 5
        fireShape.strokeColor = UIColor.black.cgColor
        fireShape.fillColor =  UIColor.black.cgColor
        return fireShape
    }
}
