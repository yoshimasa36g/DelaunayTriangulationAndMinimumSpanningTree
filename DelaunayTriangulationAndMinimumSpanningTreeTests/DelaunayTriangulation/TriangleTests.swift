//
//  TriangleTests.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/27.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import XCTest
import simd
@testable import DelaunayTriangulationAndMinimumSpanningTree

class TriangleTests: XCTestCase {
    func testGenerateTriangleContains() {
        let samples = [
            CGRect(x: 0, y: 0, width: 20, height: 10),
            CGRect(x: -8, y: -20, width: 10, height: 6),
            CGRect(x: 1, y: 1, width: 1, height: 1)
        ]

        samples.forEach {
            let triangle = Triangle.generateTriangleContains(region: $0)
            XCTAssertLessThan(triangle.p1.x, $0.origin.x)
            XCTAssertLessThan(triangle.p1.y, $0.bottom)
            XCTAssertGreaterThan(triangle.p2.x, $0.right)
            XCTAssertLessThan(triangle.p2.y, $0.bottom)
            XCTAssertGreaterThan(triangle.p3.x, $0.origin.x)
            XCTAssertLessThan(triangle.p3.x, $0.right)
            XCTAssertGreaterThan(triangle.p3.y, $0.origin.y)
            XCTAssertGreaterThan(triangle.area, $0.area)
        }
    }

    func testEdges() {
        let samples = [
            (p1: CGPoint(x: 3, y: 4), p2: CGPoint(x: 0, y: 0), p3: CGPoint(x: 3, y: 4)),
            (p1: CGPoint(x: 3, y: 1), p2: CGPoint(x: 9, y: 9), p3: CGPoint(x: -6, y: -8)),
            (p1: CGPoint(x: -2, y: -8), p2: CGPoint(x: -5, y: 4), p3: CGPoint(x: 3, y: -12))
        ]

        samples.forEach {
            let triangle = Triangle(p1: $0.p1, p2: $0.p2, p3: $0.p3)
            XCTAssertEqual(triangle.edges.count, 3)
            XCTAssertTrue(triangle.edges.contains(Edge(start: $0.p1, end: $0.p2)))
            XCTAssertTrue(triangle.edges.contains(Edge(start: $0.p3, end: $0.p2)))
            XCTAssertTrue(triangle.edges.contains(Edge(start: $0.p1, end: $0.p3)))
        }
    }

    func testCircumscribedCircle() {
        let samples = [
            (p1: CGPoint(x: 3, y: 4), p2: CGPoint(x: 0, y: 0), p3: CGPoint(x: 6, y: 4)),
            (p1: CGPoint(x: 3, y: 1), p2: CGPoint(x: 9, y: 9), p3: CGPoint(x: -6, y: -8)),
            (p1: CGPoint(x: -2, y: -8), p2: CGPoint(x: -5, y: 4), p3: CGPoint(x: 3, y: -12))
        ]

        samples.forEach {
            let triangle = Triangle(p1: $0.p1, p2: $0.p2, p3: $0.p3)
            let circle = triangle.circumscribedCircle()
            XCTAssertEqual(circle.center.distance(from: $0.p1), circle.radius)
            XCTAssertEqual(circle.center.distance(from: $0.p2), circle.radius)
            XCTAssertEqual(circle.center.distance(from: $0.p3), circle.radius)
        }
    }

    func testHasSamePointTo() {
        let samples = [
            (t1: Triangle(
                p1: CGPoint(x: 1, y: 2), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 5, y: 6)),
             t2: Triangle(
                p1: CGPoint(x: 7, y: 8), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 9, y: 1)),
             expected: true),
            (t1: Triangle(
                p1: CGPoint(x: 1, y: 2), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 5, y: 6)),
             t2: Triangle(
                p1: CGPoint(x: 7, y: 8), p2: CGPoint(x: 1, y: 3), p3: CGPoint(x: 9, y: 1)),
             expected: false)
        ]

        samples.forEach {
            XCTAssertEqual($0.t1.hasSamePointTo(other: $0.t2), $0.expected)
        }
    }

    func testEqualOperator() {
        let samples = [
            (t1: Triangle(
                p1: CGPoint(x: 1, y: 2), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 5, y: 6)),
             t2: Triangle(
                p1: CGPoint(x: 1, y: 2), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 5, y: 6)),
             expected: true),
            (t1: Triangle(
                p1: CGPoint(x: 1, y: 2), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 5, y: 6)),
             t2: Triangle(
                p1: CGPoint(x: 3, y: 4), p2: CGPoint(x: 5, y: 6), p3: CGPoint(x: 1, y: 2)),
             expected: true),
            (t1: Triangle(
                p1: CGPoint(x: 1, y: 2), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 5, y: 6)),
             t2: Triangle(
                p1: CGPoint(x: 1, y: 1), p2: CGPoint(x: 3, y: 4), p3: CGPoint(x: 5, y: 6)),
             expected: false)
        ]

        samples.forEach {
            XCTAssertEqual($0.t1 == $0.t2, $0.expected)
            XCTAssertEqual($0.t1 != $0.t2, !$0.expected)
        }
    }
}

extension Triangle {
    var area: CGFloat {
        let base = p1.distance(from: p2)
        let center = CGPoint(x: (p1.x + p2.x) / 2.0, y: (p1.y + p2.y) / 2.0)
        let height = center.distance(from: p3)
        return base * height / 2.0
    }
}

extension CGRect {
    var right: CGFloat {
        return origin.x + size.width
    }

    var bottom: CGFloat {
        return origin.y + size.height
    }

    var area: CGFloat {
        return size.width * size.height
    }
}
