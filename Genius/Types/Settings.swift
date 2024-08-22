//
//  Settings.swift
//  Genius
//
//  Created by F1248.
//

enum Settings {

    enum InterfaceMode: String, CaseIterable, Identifiable, Comparable {

        case verySimple = "Very Simple"
        case simple = "Simple"
        case normal = "Normal"
        case advanced = "Advanced"
        case powerUser = "Power User"

        var id: Self { self }
        var index: Int { Self.allCases.firstIndex(of: self)! } // swiftlint:disable:this force_unwrapping
        var localized: String { rawValue.localized }

        init() { self = .normal }

        static func < (lhs: Self, rhs: Self) -> Bool {
            lhs.index < rhs.index
        }
    }
}