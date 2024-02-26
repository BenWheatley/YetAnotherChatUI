//
//  ContentView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI
import SwiftData

import SwiftUI

struct ChatSessionView: View {
	@ObservedObject var viewModel: ChatSessionViewModel

	var body: some View {
		HStack(spacing: 0) {
			ChatsListView(isVisible: viewModel.isChatsListVisible)
			ChatSessionContentView(viewModel: viewModel)
		}
	}
}

#Preview {
	ChatSessionView(viewModel: ChatSessionViewModel())
        .modelContainer(for: Item.self, inMemory: true)
}
