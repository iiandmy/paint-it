//
//  Rectangle.swift
//  paint-it
//
//  Created by IlyaCool on 28.04.22.
//

import CoreGraphics
import UIKit

class Rectangle: Shape {
    
    override init(startPoint: CGPoint, size: CGSize) {
        super.init(startPoint: startPoint, size: size)
        
        self.bezierPath = buildBezier()
    }
    
    private func buildBezier() -> UIBezierPath {
        return UIBezierPath(rect: CGRect(x: viewOffset, y: viewOffset, width: size.width - 2 * viewOffset, height: size.height - 2 * viewOffset))
    }
    
}

