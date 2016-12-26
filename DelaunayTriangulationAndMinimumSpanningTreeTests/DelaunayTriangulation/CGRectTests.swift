//
//  CGRectTests.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/27.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import XCTest
@testable import DelaunayTriangulationAndMinimumSpanningTree

class CGRectTests: XCTestCase {
    func testCenter() {
        let samples = [
            (rect: CGRect(x: 0, y: 0, width: 10, height: 20), expected: CGPoint(x: 5, y: 10)),
            (rect: CGRect(x: 10, y: 20, width: 30, height: 10), expected: CGPoint(x: 25, y: 25)),
            (rect: CGRect(x: -7, y: -100, width: 19, height: 20), expected: CGPoint(x: 2.5, y: -90))
        ]

        samples.forEach {
            let actual = $0.rect.center
            XCTAssertEqual(actual, $0.expected)
        }
    }
}
