//
//  ChatSessionContentView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct ChatSessionContentView: View {
	@ObservedObject var viewModel: ChatSessionViewModel

	var body: some View {
		VStack {
			// ... rest of your HTML content goes here
			
			SettingsView(viewModel: viewModel)

			ChatTitleView(title: $viewModel.chatTitle)

			// Chat Table
			List {
				// ... chat messages go here
			}

			UserInputRowView(message: $viewModel.userMessage)

			if viewModel.isScrollToBottomVisible {
				ScrollToBottomButton()
			}
		}
		.padding()
	}
}

#Preview {
	ChatSessionContentView(viewModel: ChatSessionViewModel())
}
