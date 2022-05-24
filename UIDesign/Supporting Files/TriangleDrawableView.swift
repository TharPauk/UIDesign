//
//  TriangleDrawableView.swift
//  UIDesign
//
//  Created by Min Thet Maung on 24/05/2022.
//

import UIKit


@IBDesignable class TriangleDrawableView: UIView {
    
    private var x: CGFloat = 0
    
    @IBInspectable var slopeXPosition: CGFloat {
        get { return x }
        set { addLeftSlope(x: newValue) }
    }
    
    func addLeftSlope(x: CGFloat) {
        self.x = x
        let height = bounds.height
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: x, y: height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: height))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = backgroundColor?.cgColor
        shapeLayer.lineWidth = 0
        
        layer.addSublayer(shapeLayer)
    }
}

