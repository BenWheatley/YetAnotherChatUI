//
//  SettingsView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var viewModel: ChatSessionViewModel

	var body: some View {
		Group {
			Text("list of settings")
		}
	}
}

#Preview {
	SettingsView(viewModel: ChatSessionViewModel())
}
