//
//  MenuItem.swift
//  UIDesign
//
//  Created by Min Thet Maung on 25/05/2022.
//

import UIKit


@IBDesignable class MenuItem: UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
        set { layer.borderColor = newValue.cgColor }
    }
    
    @IBInspectable var isTranslate: Bool {
        get { return self.isTranslate }
        set {
            if newValue {
                translate()
            } else {
                self.transform = .identity
            }
        }
    }
    
    func translate() {
        let angle: CGFloat = 25.0 * CGFloat.pi / 180.0
        transform.c = sin(-angle)
    }
  
}

extension UIView {

    func createDottedLine(width: CGFloat, color: CGColor) {
        let caShapeLayer = CAShapeLayer()
        caShapeLayer.strokeColor = color
        caShapeLayer.lineWidth = width
        caShapeLayer.lineDashPattern = [2,3]
        let cgPath = CGMutablePath()
        let cgPoint = [CGPoint(x: 0, y: 0), CGPoint(x: self.frame.width, y: 0)]
        cgPath.addLines(between: cgPoint)
        
        
        let cgPoint2 = [CGPoint(x: 0, y: self.frame.height), CGPoint(x: self.frame.width, y: self.frame.height)]
        cgPath.addLines(between: cgPoint2)
        
        
        let cgPoint3 = [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: self.frame.height)]
        cgPath.addLines(between: cgPoint3)
        
        
        let cgPoint4 = [CGPoint(x: frame.width, y: 0), CGPoint(x: frame.width, y: frame.height)]
        cgPath.addLines(between: cgPoint4)
        
        
        caShapeLayer.path = cgPath
        layer.addSublayer(caShapeLayer)
    }
    
}
