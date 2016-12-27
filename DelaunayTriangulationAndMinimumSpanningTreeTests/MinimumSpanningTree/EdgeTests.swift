//
//  EdgeTests.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/28.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import XCTest
@testable import DelaunayTriangulationAndMinimumSpanningTree

class EdgeTests: XCTestCase {
    func testLength() {
        let samples = [
            (p1: CGPoint(x: 0, y: 0), p2: CGPoint(x: 3, y: 4), expected: CGFloat(5)),
            (p1: CGPoint(x: 3, y: 1), p2: CGPoint(x: 9, y: 9), expected: CGFloat(10)),
            (p1: CGPoint(x: -20, y: -8), p2: CGPoint(x: -15, y: 4), expected: CGFloat(13))
        ]

        samples.forEach {
            let edge = Edge(start: $0.p1, end: $0.p2)
            XCTAssertEqual(edge.length, $0.expected)
        }
    }

    func testEqualOperator() {
        let samples = [
            (e1: Edge(start: CGPoint(x: 3, y: 4), end: CGPoint(x: 5, y: 6)),
             e2: Edge(start: CGPoint(x: 3, y: 4), end: CGPoint(x: 5, y: 6)),
             expected: true),
            (e1: Edge(start: CGPoint(x: 3, y: 4), end: CGPoint(x: 5, y: 6)),
             e2: Edge(start: CGPoint(x: 5, y: 6), end: CGPoint(x: 3, y: 4)),
             expected: true),
            (e1: Edge(start: CGPoint(x: 3, y: 4), end: CGPoint(x: 5, y: 6)),
             e2: Edge(start: CGPoint(x: 3, y: 4), end: CGPoint(x: 6, y: 6)),
             expected: false)
        ]

        samples.forEach {
            XCTAssertEqual($0.e1 == $0.e2, $0.expected)
            XCTAssertEqual($0.e1 != $0.e2, !$0.expected)
        }
    }
}
