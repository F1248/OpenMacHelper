//
//  ContentView.swift
//  Genius
//
//  Created by F1248.
//

import SwiftUI
import SwiftUICore

struct ContentView: View {

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        if #available(macOS 15, *) {
            TabView {
                Tab("Home") {
                    HomeView()
                }
                Tab("System Information", tableName: interfaceMode.localizationTable) {
                    SystemInformationView()
                }
                Tab("Maintenance") {
                    MaintenanceView()
                }
                Tab("Settings") {
                    SettingsView()
                }
            }
            .frame(minWidth: 686, minHeight: 256)
        } else {
            TabViewLegacy(entireWindow: true) {
                TabLegacy("Home") {
                    HomeView()
                }
                TabLegacy("System Information", tableName: interfaceMode.localizationTable) {
                    SystemInformationView()
                }
                TabLegacy("Maintenance") {
                    MaintenanceView()
                }
                TabLegacy("Settings") {
                    SettingsView()
                }
            }
            .frame(minWidth: 686, minHeight: 256)
        }
    }
}

#Preview {
    ContentView()
}
