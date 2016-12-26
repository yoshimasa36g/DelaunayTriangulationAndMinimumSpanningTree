//
//  CGPointTests.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/27.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import XCTest
@testable import DelaunayTriangulationAndMinimumSpanningTree

class CGPointTests: XCTestCase {
    func testDistance() {
        let samples = [
            (p1: CGPoint(x: 0, y: 0), p2: CGPoint(x: 3, y: 4), expected: CGFloat(5)),
            (p1: CGPoint(x: 3, y: 1), p2: CGPoint(x: 9, y: 9), expected: CGFloat(10)),
            (p1: CGPoint(x: -20, y: -8), p2: CGPoint(x: -15, y: 4), expected: CGFloat(13))
        ]

        samples.forEach {
            let actual = $0.p1.distance(from: $0.p2)
            XCTAssertEqual(actual, $0.expected)
        }
    }

    func testSumOfSquares() {
        let samples = [
            (point: CGPoint(x: 1, y: 2), expected: CGFloat(5)),
            (point: CGPoint(x: 0, y: 0), expected: CGFloat(0)),
            (point: CGPoint(x: -8, y: 6), expected: CGFloat(100))
        ]

        samples.forEach {
            let actual = $0.point.sumOfSquares()
            XCTAssertEqual(actual, $0.expected)
        }
    }

    func testSubtractOperator() {
        let samples = [
            (p1: CGPoint(x: 3, y: 4), p2: CGPoint(x: 0, y: 0), expected: CGPoint(x: 3, y: 4)),
            (p1: CGPoint(x: 3, y: 1), p2: CGPoint(x: 9, y: 9), expected: CGPoint(x: -6, y: -8)),
            (p1: CGPoint(x: -2, y: -8), p2: CGPoint(x: -5, y: 4), expected: CGPoint(x: 3, y: -12))
        ]

        samples.forEach {
            let actual = $0.p1 - $0.p2
            XCTAssertEqual(actual, $0.expected)
        }
    }
}
