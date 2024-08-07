//
//  SettingsView.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct SettingsView: View {

    @AppStorage("interfaceMode")
    var interfaceMode = Settings.InterfaceMode()

    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()
            Form {
                Picker("Interface Mode:", selection: $interfaceMode) {
                    ForEach(Settings.InterfaceMode.allCases) { interfaceMode in
                        Text(interfaceMode.localized)
                    }
                }
                .pickerStyle(.inline)
            }
        }
    }
}

#Preview {
    SettingsView()
}
