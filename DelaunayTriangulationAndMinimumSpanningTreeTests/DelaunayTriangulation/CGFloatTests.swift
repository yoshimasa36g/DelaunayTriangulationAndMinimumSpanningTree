//
//  CGFloatTests.swift
//  DelaunayTriangulationAndMinimumSpanningTree
//
//  Created by Yoshimasa Aoki on 2016/12/27.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import XCTest
@testable import DelaunayTriangulationAndMinimumSpanningTree

class CGFloatTests: XCTestCase {
    func testSquare() {
        let samples = [
            (source: CGFloat(1.0), expected: CGFloat(1.0)),
            (source: CGFloat(2.0), expected: CGFloat(4.0)),
            (source: CGFloat(-3.0), expected: CGFloat(9.0))
        ]

        samples.forEach {
            let actual = $0.source.square()
            XCTAssertEqual(actual, $0.expected)
        }
    }
}
