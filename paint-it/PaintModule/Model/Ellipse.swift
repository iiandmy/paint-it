//
//  Circle.swift
//  paint-it
//
//  Created by IlyaCool on 28.04.22.
//

import UIKit
import CoreGraphics

class Ellipse: Shape {
    
    override init(startPoint: CGPoint, size: CGSize) {
        super.init(startPoint: startPoint, size: CGSize(width: size.width, height: size.height))
        
        self.bezierPath = buildBezier()
    }
    
    private func buildBezier() -> UIBezierPath {
        return UIBezierPath(ovalIn: CGRect(x: viewOffset, y: viewOffset,
                            width: size.width - 2 * viewOffset, height: size.height - 2 * viewOffset))
    }
    
}
