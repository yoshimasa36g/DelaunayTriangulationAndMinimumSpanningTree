//
//  UniqueTriangles.swift
//  DelaunayTriangulationSample
//
//  Created by Yoshimasa Aoki on 2016/12/21.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

struct UniqueTriangles {

    private let trianglesWithCount: [Triangle: Int]

    init() {
        trianglesWithCount = [Triangle: Int]()
    }

    private init(defaultValue: [Triangle: Int]) {
        trianglesWithCount = defaultValue
    }

    func add(triangle: Triangle) -> UniqueTriangles {
        var newValue = trianglesWithCount
        newValue[triangle] = (newValue[triangle] ?? 0) + 1
        return UniqueTriangles(defaultValue: newValue)
    }

    func get() -> [Triangle] {
        return trianglesWithCount.filter({ $1 == 1 }).map { (t, _) in t }
    }
}
