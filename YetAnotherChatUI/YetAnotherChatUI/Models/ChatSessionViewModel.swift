//
//  ChatSessionViewModel.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import Foundation

class ChatSessionViewModel {
	var chatTitle: String = ""
	var messages: [Message] = []
	var settings: ChatSettings = .s
	
	init(chatTitle: String = "", messages: [Message] = [], settings: ChatSettings = ChatSettings.savedSettings) {
		self.chatTitle = chatTitle
		self.messages = messages
		self.settings = settings
	}
}
