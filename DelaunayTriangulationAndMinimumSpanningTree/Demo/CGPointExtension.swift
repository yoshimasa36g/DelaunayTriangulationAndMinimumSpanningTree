//
//  PointNode.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/22.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import SpriteKit

extension CGPoint {
    func toShapeNode() -> SKShapeNode {
        let radius: CGFloat = 5.0
        let node = SKShapeNode(circleOfRadius: radius)
        node.position = self
        node.fillColor = UIColor.red
        return node
    }
}
