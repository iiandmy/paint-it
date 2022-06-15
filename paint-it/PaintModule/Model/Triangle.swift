//
//  Triangle.swift
//  paint-it
//
//  Created by IlyaCool on 28.04.22.
//

import UIKit

class Triangle: Shape {
    
    override init(startPoint: CGPoint, size: CGSize) {
        super.init(startPoint: startPoint, size: size)
        
        self.bezierPath = buildBezier()
    }
    
    private func buildBezier() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: viewOffset, y: size.height - viewOffset))
        path.addLine(to: CGPoint(x: size.width - viewOffset, y: size.height - viewOffset))
        path.addLine(to: CGPoint(x: size.width / 2, y: viewOffset))
        path.close()
        
        return path
    }
    
}
