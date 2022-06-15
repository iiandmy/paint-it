//
//  ShapeFactory.swift
//  paint-it
//
//  Created by IlyaCool on 28.04.22.
//

import CoreGraphics
import UIKit

enum ShapeFactoryError: Error {
    case invalidShapeName
}

class ShapeFactory {
    
    static let instance = ShapeFactory()
    var shapes: [String: (CGPoint, CGSize) -> Shape]
    
    private init() {
        shapes = Dictionary()
        shapes["Triangle"] = { start, size in return Triangle(startPoint: start, size: size) }
        shapes["Rectangle"] = { start, size in return Rectangle(startPoint: start, size: size) }
        shapes["Ellipse"] = { start, size in return Ellipse(startPoint: start, size: size) }
        shapes["Trapezium"] = { start, size in return Trapezium(startPoint: start, size: size) }
        shapes["Pentagon"] = { start, size in return Pentagon(startPoint: start, size: size) }
        shapes["ArrowRight"] = { start, size in return RightArrow(startPoint: start, size: size) }
        shapes["ArrowLeft"] = { start, size in return LeftArrow(startPoint: start, size: size) }
    }
    
    func getNames() -> [String] {
        return shapes.keys.sorted()
    }
    
    func get(shape: String, startsIn point: CGPoint, withSize size: CGSize) throws -> Shape {
        guard let result = shapes[shape] else { throw ShapeFactoryError.invalidShapeName }
        return result(point, size)
    }
    
}
