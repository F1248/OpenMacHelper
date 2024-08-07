//
//  VersionNumber.swift
//  OpenMacHelper
//
//  Created by F1248.
//

import SwiftUI

struct VersionNumber {

    let versions: [Int]
    var major: Int? { versions.first }

    init?(_ versionNumber: Any?) {
        guard let versionNumber = versionNumber as? Substring else { return nil }
        let components = versionNumber.split(separator: ".")
        guard !components.isEmpty else { return nil }
        guard let versions = [Int](components) else { return nil }
        self.versions = versions
    }
}
