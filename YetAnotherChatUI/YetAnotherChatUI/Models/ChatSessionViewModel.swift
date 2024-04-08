//
//  ChatSessionViewModel.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import Foundation
import SwiftData

@Model
class ChatSessionViewModel: ObservableObject, Codable {
	var chatTitle: String
	var messages: [Message]
	var settings: ChatSettings
	
	init(chatTitle: String = "", messages: [Message] = [], settings: ChatSettings = .savedSettings) {
		self.chatTitle = chatTitle
		self.messages = messages
		self.settings = settings
	}
	
	enum CodingKeys: CodingKey {
		case chatTitle, messages, settings
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(chatTitle, forKey: .chatTitle)
		try container.encode(messages, forKey: .messages)
		try container.encode(settings, forKey: .settings)
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		chatTitle = try container.decode(String.self, forKey: .chatTitle)
		messages = try container.decode([Message].self, forKey: .messages)
		settings = try container.decode(ChatSettings.self, forKey: .settings)
	}
}
