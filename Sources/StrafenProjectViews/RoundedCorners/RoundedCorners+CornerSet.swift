//
//  File.swift
//  
//
//  Created by Steven on 13.07.22.
//

import Foundation

extension RoundedCorners {

    /// All differnt corner sets
    public struct CornerSet: OptionSet {

        /// Raw value of the option set.
        public let rawValue: Int

        /// Initializes option set with specified raw value.
        /// - Parameter rawValue: Raw value of the option set.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }

        /// Only the top left corner.
        public static let topLeft = CornerSet(rawValue: 1 << 0)

        /// Only the top right corner.
        public static let topRight = CornerSet(rawValue: 1 << 1)

        /// Only the bottom left corner.
        public static let bottomLeft = CornerSet(rawValue: 1 << 2)

        /// Only the bottom right corner.
        public static let bottomRight = CornerSet(rawValue: 1 << 3)

        /// Only the two top corners.
        public static let top: CornerSet = []

        /// Only the two bottom corners.
        public static let bottom: CornerSet = []

        /// Only the two left corners.
        public static let left: CornerSet = []

        /// Only the two right corners.
        public static let right: CornerSet = []

        /// Top left and bottom right corner.
        public static let mainDiagonal: CornerSet = []

        /// Top right and bottom left corner.
        public static let secondaryDiagonal: CornerSet = []

        /// All corners
        public static let all: CornerSet = []

        /// No corners
        public static let none: CornerSet = []
    }
}
