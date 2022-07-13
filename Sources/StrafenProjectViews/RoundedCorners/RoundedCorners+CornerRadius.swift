//
//  File.swift
//  
//
//  Created by Steven on 13.07.22.
//

import Foundation

extension RoundedCorners {

    /// Contains all corner radii.
    public struct CornerRadius {

        /// Radius of the top left corner.
        public let topLeft: CGFloat

        /// Radius of the top right corner.
        public let topRight: CGFloat

        /// Radius of the bottom right corner.
        public let bottomRight: CGFloat

        /// Radius of the bottom left corner.
        public let bottomLeft: CGFloat

        /// Initializes corner radius with specified radius for all corners.
        /// - Parameters:
        ///   - topLeft: Radius of the top left corner.
        ///   - topRight: Radius of the top right corner.
        ///   - bottomLeft: Radius of the bottom right corner.
        ///   - bottomRight: Radius of the bottom left corner.
        public init(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {
            self.topLeft = topLeft
            self.topRight = topRight
            self.bottomLeft = bottomLeft
            self.bottomRight = bottomRight
        }

        /// Inizializes radius of specified corner set with specified radius.
        /// - Parameters:
        ///   - cornerRadius: Radius of the corner in specified corner set.
        ///   - corner: Set of corners to set radius.
        public init(_ cornerRadius: CGFloat, corner cornerSet: CornerSet = .all) {
            self.topLeft = cornerSet.contains(.topLeft) ? cornerRadius : 0
            self.topRight = cornerSet.contains(.topRight) ? cornerRadius : 0
            self.bottomLeft = cornerSet.contains(.bottomLeft) ? cornerRadius : 0
            self.bottomRight = cornerSet.contains(.bottomRight) ? cornerRadius : 0
        }
    }
}
