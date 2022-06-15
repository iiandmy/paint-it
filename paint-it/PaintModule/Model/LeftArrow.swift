//
//  LeftArrow.swift
//  paint-it
//
//  Created by IlyaCool on 9.05.22.
//

import UIKit

class LeftArrow: Shape {
    
    override init(startPoint: CGPoint, size: CGSize) {
        super.init(startPoint: startPoint, size: size)
        
        self.bezierPath = buildBezier()
    }
    
    private func buildBezier() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: size.width, y: size.height / 3))
        path.addLine(to: CGPoint(x: size.width, y: size.height * 2 / 3))
        path.addLine(to: CGPoint(x: size.width * 2 / 5, y: size.height * 2 / 3))
        path.addLine(to: CGPoint(x: size.width * 2 / 5, y: size.height))
        path.addLine(to: CGPoint(x: viewOffset, y: size.height / 2))
        path.addLine(to: CGPoint(x: size.width * 2 / 5, y: viewOffset))
        path.addLine(to: CGPoint(x: size.width * 2 / 5, y: size.height / 3))
        path.close()
        
        return path
    }
    
}
