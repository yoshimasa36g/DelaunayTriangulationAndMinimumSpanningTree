//
//  DelaunayTriangles.swift
//  DelaunayTriangulationSample
//
//  Created by Yoshimasa Aoki on 2016/12/19.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import CoreGraphics

struct DelaunayTriangles {

    static func calculate(points: [CGPoint], region: CGRect) -> [Triangle] {
        if points.count < 3 {
            return [Triangle]()
        }

        let outerTriangle = Triangle.generateTriangleContains(region: region)
        let triangles = [outerTriangle]
        return points.reduce(triangles, addPointThenTriangulation)
            .filter { !$0.hasSamePointTo(other: outerTriangle) }
    }

    private static func addPointThenTriangulation(triangles: [Triangle],
                                                  point: CGPoint) -> [Triangle] {
        let initial = (remains: [Triangle](), unique: UniqueTriangles())

        let result = triangles.reduce(initial) { (result, triangle) in
            if !triangle.circumscribedCircle().contains(point: point) {
                return (remains: result.remains + [triangle], unique: result.unique)
            }

            let unique = result.unique
                .add(triangle: Triangle(p1: point, p2: triangle.p1, p3: triangle.p2))
                .add(triangle: Triangle(p1: point, p2: triangle.p2, p3: triangle.p3))
                .add(triangle: Triangle(p1: point, p2: triangle.p3, p3: triangle.p1))
            return (remains: result.remains, unique: unique)
        }

        return result.remains + result.unique.get()
    }
}
