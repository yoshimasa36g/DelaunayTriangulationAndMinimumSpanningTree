//
//  EdgeExtension.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/25.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import SpriteKit

extension Edge {
    func toShapeNode() -> SKShapeNode {
        var points = [start, end]
        let node = SKShapeNode(points: &points, count: points.count)
        node.strokeColor = UIColor.cyan
        node.lineWidth = 4
        node.zPosition = -1
        return node
    }
}
