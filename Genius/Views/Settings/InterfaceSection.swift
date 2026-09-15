//
// © 2026 F1248 <f1248@mailbox.org>
// See LICENSE.txt for license information.
//

import Defaults
import SwiftUI

struct InterfaceSection: View {

	@Default(.useTextInsteadOfSymbols)
	var useTextInsteadOfSymbols: Bool
	@Default(.interfaceMode)
	var interfaceMode: Settings.InterfaceMode
	@Default(.disableLiquidGlass)
	var disableLiquidGlass: Bool
	@Default(.hideIconsInMenuBar)
	var hideIconsInMenuBar: Bool

	var body: some View {
		Section(.interface) {
			SettingToggle(.useTextInsteadOfSymbols, value: $useTextInsteadOfSymbols, key: .useTextInsteadOfSymbols)
			SettingPicker(.interfaceMode, value: $interfaceMode, key: .interfaceMode)
				.pickerStyle(.radioGroup)
			SettingToggle(
				.disableLiquidGlass,
				value: $disableLiquidGlass,
				key: .disableLiquidGlass,
				if: NSAppearance.disableLiquidGlassAvailable && interfaceMode >= .normal,
			)
			.onChange(of: disableLiquidGlass) { _ in RelaunchDialog.present() }
			SettingToggle(
				.hideIconsInMenuBar,
				value: $hideIconsInMenuBar,
				key: .hideIconsInMenuBar,
				if: NSMenuItem.hideIconsInMenuBarAvailable && interfaceMode >= .advanced,
			)
			.id(disableLiquidGlass)
			.onChange(of: hideIconsInMenuBar) { _ in RelaunchDialog.present() }
		}
	}
}
