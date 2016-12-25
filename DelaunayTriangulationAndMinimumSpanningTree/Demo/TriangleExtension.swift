//
//  TriangleNode.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/22.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import SpriteKit

extension Triangle {
    func toShapeNode() -> SKShapeNode {
        var points = [p1, p2, p3, p1]
        let node = SKShapeNode(points: &points, count: points.count)
        node.lineWidth = 1
        node.strokeColor = UIColor.lightGray
        node.zPosition = -1
        return node
    }
}
