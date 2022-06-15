//
//  DrawPanel.swift
//  paint-it
//
//  Created by IlyaCool on 28.04.22.
//

import UIKit

class DrawPanel: UIView {

    var shapeToDraw: String!
    var firstPoint: CGPoint!
    var secondPoint: CGPoint!
    var isDrawing: Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing.toggle()
        if (isDrawing) {
            firstPoint = touches.first?.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        isDrawing = false
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (!isDrawing) {
            let correctPoints = getCorrectPoints(firstPoint: firstPoint, secondPoint: (touches.first?.location(in: self))!)
            firstPoint = correctPoints.start
            secondPoint = correctPoints.end
            
            draw()
        }
    }
    
    private func draw() {
        let wrapper = ShapeWrapper()
        wrapper.backgroundColor = .transparent
        
        let shape: Shape!
        
        do {
            shape = try ShapeFactory.instance.get(shape: shapeToDraw, startsIn: firstPoint, withSize: getDimension())
        } catch {
            fatalError()
        }
        
        self.addSubview(wrapper)
        wrapper.draw(shape)
    }
    
    private func getDimension() -> (CGSize) {
        let width = secondPoint.x - firstPoint.x
        let height = secondPoint.y - firstPoint.y
        return CGSize(width: width, height: height)
    }
    
    private func getCorrectPoints(firstPoint: CGPoint, secondPoint: CGPoint) -> (start: CGPoint, end: CGPoint) {
        return (start: CGPoint(x: min(firstPoint.x, secondPoint.x), y: min(firstPoint.y, secondPoint.y)),
                end: CGPoint(x: max(firstPoint.x, secondPoint.x), y: max(firstPoint.y, secondPoint.y)))
    }
}

class ShapeWrapper: UIView {
    private var path: UIBezierPath?
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        path?.stroke()
    }
    
    func draw(_ shape: Shape) {
        frame.size = shape.size
        frame.origin = shape.startPoint
        path = shape.bezierPath
        setNeedsDisplay()
    }
}
