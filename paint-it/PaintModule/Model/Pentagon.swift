//
//  Pentagon.swift
//  paint-it
//
//  Created by IlyaCool on 9.05.22.
//

import UIKit

class Pentagon: Shape {
    
    override init(startPoint: CGPoint, size: CGSize) {
        super.init(startPoint: startPoint, size: size)
        
        self.bezierPath = buildBezier()
    }
    
    private func buildBezier() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: size.width / 2, y: viewOffset))
        path.addLine(to: CGPoint(x: viewOffset, y: size.height * 2 / 5))
        path.addLine(to: CGPoint(x: size.width / 5, y: size.height))
        path.addLine(to: CGPoint(x: size.width * 4 / 5, y: size.height))
        path.addLine(to: CGPoint(x: size.width, y: size.height * 2 / 5))
        path.close()
        
        return path
    }
    
}
