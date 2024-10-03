//
//  ContentViewTab.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

import SwiftUICore

enum ContentViewTab: String, ViewTab {

    case home = "Home"
    case systemInformation = "System Information"
    case maintenance = "Maintenance"
    case settings = "Settings"

    var variesByInterfaceMode: Bool {
        switch self {
        case .systemInformation: true
        default: false
        }
    }

    var content: AnyView {
        switch self {
        case .home: AnyView(HomeView())
        case .systemInformation: AnyView(SystemInformationView())
        case .maintenance: AnyView(MaintenanceView())
        case .settings: AnyView(SettingsView())
        }
    }
}
