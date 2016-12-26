//
//  CircleTests.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/27.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import XCTest
@testable import DelaunayTriangulationAndMinimumSpanningTree

class CircleTests: XCTestCase {
    func testContains() {
        let samples = [
            (circle: Circle(center: CGPoint(x: 0, y: 0), radius: 5.0),
             point: CGPoint(x: 3, y: 4),
             expected: true),
            (circle: Circle(center: CGPoint(x: 0, y: 0), radius: 5.0),
             point: CGPoint(x: 4, y: 4),
             expected: false)
        ]

        samples.forEach {
            let actual = $0.circle.contains(point: $0.point)
            XCTAssertEqual(actual, $0.expected)
        }
    }
}
