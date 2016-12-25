//
//  Edge.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/23.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import CoreGraphics

struct Edge: Equatable, Hashable {
    let start: CGPoint
    let end: CGPoint

    var length: CGFloat {
        return start.distance(from: end)
    }

    var hashValue: Int {
        return 0
    }
}

func == (left: Edge, right: Edge) -> Bool {
    return (left.start == right.start && left.end == right.end)
        || (left.start == right.end && left.end == right.start)
}

func != (left: Edge, right: Edge) -> Bool {
    return !(left == right)
}
