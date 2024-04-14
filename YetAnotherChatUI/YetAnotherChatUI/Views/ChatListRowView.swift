//
//  ChatListRowView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 26/02/2024.
//

import SwiftUI

struct ChatListRowView: View {
	var chat: ChatSession
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 5)
				.fill(Color(.chatListCellBackground))
			
			VStack {
				Text(chat.chatTitle)
					.font(.headline)
					.frame(maxWidth: .infinity, alignment: .leading)
					
				Text(chat.lastModified.formatted(date: .numeric, time: .complete))
					.font(.subheadline)
					.foregroundStyle(.secondary)
					.frame(maxWidth: .infinity, alignment: .trailing)
			}
			.padding(5)
		}

	}
}

#Preview {
	ChatListRowView(chat: ChatSession())
}
