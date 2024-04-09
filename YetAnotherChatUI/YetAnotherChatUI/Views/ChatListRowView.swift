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
		Text(chat.chatTitle)
    }
}

#Preview {
	ChatListRowView(chat: ChatSession())
}
