//
//  GameScene.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/22.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        refresh()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        refresh()
    }

    private func refresh() {
        removeAllChildren()
        (1...100).forEach { _ in spawnRandomPoint() }

        let points = extractPoints()
        let triangles = DelaunayTriangles.calculate(points: points, region: frame)
        drawTriangles(triangles: triangles)

        let minimumSpanningTree = MinimumSpanningTree.calculate(points: points,
                                                                triangles: triangles)
        drawEdges(edges: minimumSpanningTree)
    }

    private func spawnRandomPoint() {
        let x = CGFloat(arc4random_uniform(UInt32(frame.size.width))) - frame.size.width / 2.0
        let y = CGFloat(arc4random_uniform(UInt32(frame.size.height))) - frame.size.height / 2.0
        let point = CGPoint(x: x, y: y)
        let node = point.toShapeNode()
        addChild(node)
    }

    private func extractPoints() -> [CGPoint] {
        return children.filter({ ($0 as? SKShapeNode)?.fillColor == UIColor.red })
            .map { $0.position }
    }

    private func removeOtherThanPoints() {
        children.lazy.map { $0 as? SKShapeNode }
            .filter { $0?.fillColor != UIColor.red }
            .forEach { $0?.removeFromParent() }
    }

    private func drawTriangles(triangles: [Triangle]) {
        triangles.forEach {
            let node = $0.toShapeNode()
            addChild(node)
        }
    }

    private func drawEdges(edges: [Edge]) {
        edges.forEach { edge in
            let node = edge.toShapeNode()
            addChild(node)
        }
    }
}
