//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import AppKit
import Foundation
import ObjectiveC

extension NSMenuItem {

	static var hideIconsInMenuBarAvailable: Bool {
		if #available(macOS 26, *) {
			if #unavailable(macOS 27) {
				true
			} else {
				false
			}
		} else {
			false
		}
	}

	@objc var none: NSImage? { nil }

	static func hideIconsInMenuBar() {
		guard let noneImplementation = unsafe class_getMethodImplementation(self, #selector(getter: none)) else { return }
		unsafe class_replaceMethod(
			self,
			#selector(getter: image),
			noneImplementation,
			nil,
		)
	}
}
