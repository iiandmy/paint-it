//
//  Trapezium.swift
//  paint-it
//
//  Created by IlyaCool on 9.05.22.
//

import UIKit

class Trapezium: Shape {
    
    override init(startPoint: CGPoint, size: CGSize) {
        super.init(startPoint: startPoint, size: size)
        
        self.bezierPath = buildBezier()
    }
    
    private func buildBezier() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: viewOffset, y: size.height - viewOffset))
        path.addLine(to: CGPoint(x: size.width - viewOffset, y: size.height - viewOffset))
        path.addLine(to: CGPoint(x: size.width * 2 / 3, y: viewOffset))
        path.addLine(to: CGPoint(x: size.width / 3, y: viewOffset))
        path.close()
        
        return path
    }
    
}
