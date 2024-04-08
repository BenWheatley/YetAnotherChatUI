//
//  ChatMessageView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 26/02/2024.
//

import SwiftUI

struct ChatMessageView: View {
	var message: Message
	
	var body: some View {
		HStack {
			Text(message.role)
				.frame(width: 100)
			Text(message.content)
		}
	}
}

#Preview {
	ChatMessageView(message: Message(role: "system", content: "You are a bot"))
}
