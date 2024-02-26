//
//  ChatsListView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct ChatsListView: View {
	var isVisible: Bool

	var body: some View {
		VStack {
			Text("Chats (stored locally)")
				.font(.title)
			Button(action: {}) {
				Text("Start new chat")
			}
			List {
				// Populate dynamically
			}
		}
		.frame(width: 200)
		.transition(.slide)
	}
}

#Preview {
	ChatsListView(isVisible: true)
}
