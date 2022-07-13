//
//  RoundedCorners.swift
//  
//
//  Created by Steven on 13.07.22.
//

import SwiftUI

/// Creates a rectangle with custom corner radii.
///
/// Default:
///
///     - Stroke Color: .black
///     - Fill Color: .clear
///     - Line Width: 1
public struct RoundedCorners: View {

    /// Stroke color of the rounded corners.
    private var strokeColor: Color = .black

    /// Fill color of the rounded corners.
    private var fillColor: Color = .clear

    /// Line width of the rounded corners.
    private var lineWidth: CGFloat = 1

    /// Radius of the corners of the rounded corners.
    private var cornerRadius: CornerRadius

    /// Inizializes rounded corners radius of specified corner with specified radius.
    /// - Parameters:
    ///   - cornerRadius: Radius of the corner in specified corner set.
    ///   - corner: Set of corners to set radius.
    public init(radius cornerRadius: CGFloat, corner cornerSet: CornerSet = .all) {
        self.cornerRadius = CornerRadius(cornerRadius, corner: cornerSet)
    }

    public var body: some View {
        GeometryReader { geometry in
            self.path(of: geometry.size)
                .fill(self.fillColor)
                .overlay {
                    self.path(of: geometry.size)
                        .stroke(self.strokeColor, lineWidth: self.lineWidth)
                }
        }
    }

    /// Path of the outline of the rounded corners.
    /// - Parameter size: Size of the path.
    /// - Returns: Path of the outline.
    private func path(of size: CGSize) -> some Shape {
        return Path { path in

            // Make sure,the radius isn't larger than the Rectange.
            let topLeft = min(self.cornerRadius.topLeft, size.width / 2, size.height / 2)
            let topRight = min(self.cornerRadius.topRight, size.width / 2, size.height / 2)
            let bottomRight = min(self.cornerRadius.bottomRight, size.width / 2, size.height / 2)
            let bottomLeft = min(self.cornerRadius.bottomLeft, size.width / 2, size.height / 2)

            // Draw the Recatage with differnt corner radii.
            path.move(to: CGPoint(x: topLeft, y: 0))
            path.addLine(to: CGPoint(x: size.width - topRight, y: 0))
            path.addArc(center: CGPoint(x: size.width - topRight, y: topRight), radius: topRight, startAngle: .degrees(-90), endAngle: .zero, clockwise: false)
            path.addLine(to: CGPoint(x: size.width, y: size.height - bottomRight))
            path.addArc(center: CGPoint(x: size.width - bottomRight, y: size.height - bottomRight), radius: bottomRight, startAngle: .zero, endAngle: .degrees(90), clockwise: false)
            path.addLine(to: CGPoint(x: bottomLeft, y: size.height))
            path.addArc(center: CGPoint(x: bottomLeft, y: size.height - bottomLeft), radius: bottomLeft, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
            path.addLine(to: CGPoint(x: 0, y: topLeft))
            path.addArc(center: CGPoint(x: topLeft, y: topLeft), radius: topLeft, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        }
    }

    /// Sets the stroke color.
    /// - Parameter strokeColor: Stroke color of the rounded corners.
    /// - Returns: Rounded corners with modified stroke color.
    public func strokeColor(_ strokeColor: Color) -> RoundedCorners {
        var roundedCorners = self
        roundedCorners.strokeColor = strokeColor
        return roundedCorners
    }

    /// Sets the fill color.
    /// - Parameter fillColor: Fill color of the rounded corners.
    /// - Returns: Rounded corners with modified fill color.
    public func fillColor(_ fillColor: Color) -> RoundedCorners {
        var roundedCorners = self
        roundedCorners.fillColor = fillColor
        return roundedCorners
    }

    /// Sets the line width.
    /// - Parameter lineWidth: Line width of the rounded corners.
    /// - Returns: Rounded corners with modified line width.
    public func lineWidth(_ lineWidth: CGFloat) -> RoundedCorners {
        var roundedCorners = self
        roundedCorners.lineWidth = lineWidth
        return roundedCorners
    }

    /// Sets the corner radius.
    /// - Parameter radius: Radius of the corners of the rounded corners.
    /// - Returns: Rounded corners with modified radius.
    func cornerRadius(_ cornerRadius: CornerRadius) -> RoundedCorners {
        var roundedCorners = self
        roundedCorners.cornerRadius = cornerRadius
        return roundedCorners
    }

    /// Sets the corner radius.
    /// - Parameters:
    ///   - cornerRadius: Radius of the corner in specified corner set.
    ///   - corner: Set of corners to set radius.
    /// - Returns: Rounded corners with modified radius.
    func radius(_ cornerRadius: CGFloat, corner cornerSet: CornerSet = .all) -> RoundedCorners {
        var roundedCorners = self
        roundedCorners.cornerRadius = CornerRadius(cornerRadius, corner: cornerSet)
        return roundedCorners
    }
}
