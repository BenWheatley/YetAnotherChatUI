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
			GDPRView()
			
			ChatTitleView(title: $viewModel.chatTitle)
			
			ZStack(alignment: .bottomTrailing) {
				List {
					ForEach(viewModel.messages.indices, id: \.self) { index in
						ChatMessageView(message: viewModel.messages[index])
					}
				}
				ScrollToBottomButton()
			}
			
			UserInputRowView()
		}
		.padding()
	}
}

#Preview {
	ChatSessionContentView(viewModel: ChatSessionViewModel())
}
