//
//  UniqueTrianglesTests.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/28.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import XCTest
@testable import DelaunayTriangulationAndMinimumSpanningTree

class UniqueTrianglesTests: XCTestCase {
    func testAddAndGet() {
        let emptyTriangles = UniqueTriangles()
        XCTAssertEqual(emptyTriangles.get().count, 0)

        let t1 = Triangle(p1: CGPoint(x: 1, y: 2), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 5, y: 6))
        let trianglesContainingT1 = emptyTriangles.add(triangle: t1)
        XCTAssertEqual(trianglesContainingT1.get().count, 1)
        XCTAssertTrue(trianglesContainingT1.get().contains(t1))

        let t2 = Triangle(p1: CGPoint(x: 1, y: 1), p2: CGPoint(x: 3, y: 3), p3: CGPoint(x: 5, y: 5))
        let trianglesContainingT1AndT2 = trianglesContainingT1.add(triangle: t2)
        XCTAssertEqual(trianglesContainingT1.get().count, 1)
        XCTAssertEqual(trianglesContainingT1AndT2.get().count, 2)
        XCTAssertTrue(trianglesContainingT1AndT2.get().contains(t1))
        XCTAssertTrue(trianglesContainingT1AndT2.get().contains(t2))

        let trianglesAddedT1Again = trianglesContainingT1AndT2.add(triangle: t1)
        XCTAssertEqual(trianglesContainingT1.get().count, 1)
        XCTAssertEqual(trianglesContainingT1AndT2.get().count, 2)
        XCTAssertEqual(trianglesAddedT1Again.get().count, 1)
        XCTAssertTrue(trianglesAddedT1Again.get().contains(t2))
    }
}
