//
//  Array.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Array {

    subscript(index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

extension [Int] {

    init?(_ strings: [any StringProtocol]?) {
        guard let strings else { return nil }
        self = strings.compactMap(Int.init)
        guard strings.count == count else { return nil }
    }
}
