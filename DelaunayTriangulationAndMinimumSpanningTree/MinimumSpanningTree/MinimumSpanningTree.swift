//
//  MinimumSpanningTree.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/23.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import CoreGraphics

struct MinimumSpanningTree {
    typealias Edge = DelaunayTriangulationAndMinimumSpanningTree.Edge

    static func calculate(points: [CGPoint], triangles: [Triangle]) -> [Edge] {
        if triangles.count == 0 || points.count == 0 {
            return [Edge]()
        }

        let edges = triangles.flatMap({ $0.edges }).sorted { $0.length < $1.length }
        var minimumSpanningTree = [Edge]()
        var processedPoints = [edges[0].start]
        while processedPoints.count != points.count {
            for edge in edges {
                if processedPoints.contains(edge.start) && !processedPoints.contains(edge.end) {
                    processedPoints.append(edge.end)
                    minimumSpanningTree.append(edge)
                    break
                }
                if processedPoints.contains(edge.end) && !processedPoints.contains(edge.start) {
                    processedPoints.append(edge.start)
                    minimumSpanningTree.append(edge)
                    break
                }
            }
        }
        return minimumSpanningTree
    }
}
