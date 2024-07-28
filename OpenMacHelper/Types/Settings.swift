//
//  Settings.swift
//  OpenMacHelper
//
//  Created by F1248.
//

enum Settings {

    enum InterfaceMode: String, CaseIterable, Identifiable, Comparable {

        case verySimple = "Very simple"
        case simple = "Simple"
        case normal = "Normal"
        case advanced = "Advanced"
        case powerUser = "Power User"

        init() { self = .normal }

        var id: Self { self }
        var localized: String { rawValue.localized }

        func index() -> Int { Self.allCases.firstIndex(of: self)! } // swiftlint:disable:this force_unwrapping
        static func < (lhs: Self, rhs: Self) -> Bool {
            lhs.index() < rhs.index()
        }
    }
}
