//
//  CGRect.swift
//  DelaunayTriangulationSample
//
//  Created by Yoshimasa Aoki on 2016/12/21.
//  Copyright © 2016年 yoshimasa36g. All rights reserved.
//

import CoreGraphics

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: size.width / 2.0 + origin.x,
                       y: size.height / 2.0 + origin.y)
    }
}
