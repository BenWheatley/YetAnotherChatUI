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
			Text("Settings")
				.font(.title3)
			Button(action: {
				withAnimation {
					viewModel.isSettingsVisible.toggle()
				}
			}) {
				Text(viewModel.isSettingsVisible ? "▼" : "▲")
			}

			if viewModel.isSettingsVisible {
				// ... settings form goes here
			}
		}
	}
}

#Preview {
	SettingsView(viewModel: ChatSessionViewModel())
}
