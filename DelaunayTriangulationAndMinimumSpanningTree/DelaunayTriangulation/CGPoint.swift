//
//  CGPoint.swift
//  DelaunayTriangulationSample
//
//  Created by Yoshimasa Aoki on 2016/12/15.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    func distance(from: CGPoint) -> CGFloat {
        return (pow(from.x - x, 2) + pow(from.y - y, 2)).squareRoot()
    }

    func sumOfSquares() -> CGFloat {
        return x.square() + y.square()
    }
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
