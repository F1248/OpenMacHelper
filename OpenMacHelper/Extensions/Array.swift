//
//  Array.swift
//  OpenMacHelper
//
//  Created by F1248.
//

extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}