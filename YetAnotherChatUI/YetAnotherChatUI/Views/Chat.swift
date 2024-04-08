//
//  Chat.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 26/02/2024.
//

import Foundation
import SwiftData

@Model
class ChatViewModel {
	var title: String
	var lastModified: Date
	
	var chatSession: ChatSessionViewModel
	
	init(title: String, lastModified: Date, chatSession: ChatSessionViewModel) {
		self.title = title
		self.lastModified = lastModified
		self.chatSession = chatSession
	}
}
