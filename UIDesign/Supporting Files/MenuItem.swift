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


