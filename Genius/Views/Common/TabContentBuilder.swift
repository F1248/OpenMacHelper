//
//  TabContentBuilder.swift
//  Genius
//
//  © 2024 F1248 <f1248@mailbox.org>
//  See LICENSE.txt for license information.
//

@resultBuilder
enum TabContentBuilder {

    static func buildBlock(_ tabs: [TabLegacy]) -> [TabLegacy] {
        tabs
    }

    static func buildBlock(_ tabs: TabLegacy...) -> [TabLegacy] {
        tabs
    }
}