//
//  Triangle.swift
//  DelaunayTriangulationSample
//
//  Created by Yoshimasa Aoki on 2016/12/15.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import CoreGraphics

struct Triangle: Equatable, Hashable {
    let p1: CGPoint
    let p2: CGPoint
    let p3: CGPoint
}

extension Triangle {
    static func generateTriangleContains(region: CGRect) -> Triangle {
        let center = region.center
        let radius = center.distance(from: region.origin) + 1.0
        return Triangle(p1: CGPoint(x: center.x - sqrt(3) * radius, y: center.y - radius),
                        p2: CGPoint(x: center.x + sqrt(3) * radius, y: center.y - radius),
                        p3: CGPoint(x: center.x, y: center.y + 2 * radius))
    }

    var hashValue: Int {
        return 0
    }

    var edges: [Edge] {
        return [
            Edge(start: p1, end: p2),
            Edge(start: p2, end: p3),
            Edge(start: p3, end: p1)
        ]
    }

    func circumscribedCircle() -> Circle {
        let center = CGPoint(x: centerX, y: centerY)
        let radius = center.distance(from: p1)
        return Circle(center: center, radius: radius)
    }

    func hasSamePointTo(other: Triangle) -> Bool {
        let myPoints = [p1, p2, p3]
        let otherPoints = [other.p1, other.p2, other.p3]
        return myPoints.contains { p in otherPoints.contains(p) }
    }

    private var centerX: CGFloat {
        let p2_1 = p2 - p1
        let p3_1 = p3 - p1
        let p1_2 = p1 - p2
        let denominator = 2.0 * (p2_1.x * p3_1.y - p2_1.y * p3_1.x)
        return (p3_1.y * (p2.sumOfSquares() - p1.sumOfSquares())
            + p1_2.y * (p3.sumOfSquares() - p1.sumOfSquares()))
            / denominator
    }

    private var centerY: CGFloat {
        let p2_1 = p2 - p1
        let p3_1 = p3 - p1
        let p1_3 = p1 - p3
        let denominator = 2.0 * (p2_1.x * p3_1.y - p2_1.y * p3_1.x)
        return (p1_3.x * (p2.sumOfSquares() - p1.sumOfSquares())
            + p2_1.x * (p3.sumOfSquares() - p1.sumOfSquares()))
            / denominator
    }
}

func == (left: Triangle, right: Triangle) -> Bool {
    let leftPoints = [left.p1, left.p2, left.p3]
        .sorted(by: { $0.x < $1.x })
        .sorted(by: { $0.y < $1.y })
    let rightPoints = [right.p1, right.p2, right.p3]
        .sorted(by: { $0.x < $1.x })
        .sorted(by: { $0.y < $1.y })
    return leftPoints[0] == rightPoints[0]
        && leftPoints[1] == rightPoints[1]
        && leftPoints[2] == rightPoints[2]
}

func != (left: Triangle, right: Triangle) -> Bool {
    return !(left == right)
}
