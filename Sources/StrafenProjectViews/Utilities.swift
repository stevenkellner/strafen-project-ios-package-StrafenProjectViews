//
//  Utilities.swift
//  
//
//  Created by Steven on 13.07.22.
//

import SwiftUI

extension Path {

    /// Add arc starting the angle on top.
    /// - Parameters:
    ///   - center: Center point of the arc.
    ///   - radius: Radius of the arc.
    ///   - startAngle: Start angle of the arc.
    ///   - endAngle: End angle of the arc.
    ///   - clockwise: Inicates whether the arc is clockwise or anti-clockwise.
    mutating func addArc(center: CGPoint,_ radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool) {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        addArc(center: center, radius: radius, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: clockwise)
    }
}
