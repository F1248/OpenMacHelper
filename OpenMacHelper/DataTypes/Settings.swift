//
//  Settings.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

enum Settings {

    enum InterfaceMode: String, CaseIterable, Identifiable {
        case verySimple = "Very simple"
        case simple = "Simple"
        case normal = "Normal"
        case advanced = "Advanced"
        case powerUser = "Power User"

        var id: Self { self }
        var localized: String {
            rawValue.localized
        }

        func index(_ mode: Self) -> Int {
            Self.allCases.firstIndex(of: mode) ?? Int()
        }
        func isAtLeast(_ mode: Self) -> Bool { index(self) >= index(mode) }
    }
}
