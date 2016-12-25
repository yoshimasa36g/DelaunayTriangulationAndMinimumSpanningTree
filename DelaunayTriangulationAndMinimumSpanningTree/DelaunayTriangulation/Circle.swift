//
//  Circle.swift
//  DelaunayTriangulationSample
//
//  Created by Yoshimasa Aoki on 2016/12/16.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import CoreGraphics

struct Circle {
    let center: CGPoint
    let radius: CGFloat

    func contains(point: CGPoint) -> Bool {
        return center.distance(from: point) <= radius
    }
}
