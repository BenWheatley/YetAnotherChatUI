//
//  ChatListRowView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 26/02/2024.
//

import SwiftUI

struct ChatListRowView: View {
	var chat: ChatViewModel
	
    var body: some View {
		Text(chat.title)
    }
}

#Preview {
	ChatListRowView(chat: ChatViewModel(title: "Example chat", lastModified: .now, chatSession: ChatSessionViewModel()))
}
