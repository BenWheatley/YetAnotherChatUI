//
//  WebChat.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 29/04/2024.
//

import Foundation

struct WebChats: Codable {
	
	let chats: [WebChat]
	
	init(from decoder: any Decoder) throws {
		var container = try decoder.unkeyedContainer()
		var chats: [WebChat] = []
		while (!container.isAtEnd) {
			chats.append(try container.decode(WebChat.self))
		}
		self.chats = chats
	}
	
	init(source: [ChatSession]) {
		chats = source.map({ chatSession in
			WebChat(
				uuid: chatSession.uuid.uuidString,
				title: chatSession.chatTitle,
				date: chatSession.lastModified,
				apiEndpoint: chatSession.settings.apiEndpoint,
				model: chatSession.settings.model,
				temperature: chatSession.settings.temperature,
				maxTokens: chatSession.settings.maxTokens,
				topP: chatSession.settings.topP,
				frequencyPenalty: chatSession.settings.frequencyPenalty,
				presencePenalty: chatSession.settings.presencePenalty,
				messages: chatSession.messages,
				systemMessage: chatSession.settings.systemMessage
			)
		})
	}
	
	func convertToAppModel() -> [ChatSession] {
		chats.map { webChat in
			let title = webChat.title
			let messages = webChat.messages // This is already in the right format
			let settings = ChatSettings(
				apiEndpoint: webChat.apiEndpoint,
				model: webChat.model,
				temperature: Float(webChat.temperature),
				maxTokens: Int(webChat.maxTokens),
				topP: Float(webChat.topP),
				frequencyPenalty: Float(webChat.frequencyPenalty),
				presencePenalty: Float(webChat.presencePenalty),
				systemMessage: webChat.systemMessage
			)
			let result = ChatSession(chatTitle: title, messages: messages, settings: settings)
			result.uuid = UUID(uuidString: webChat.uuid) ?? UUID()
			return result
		}
	}
}

extension WebChats {
	struct WebChat: Codable {
		let uuid: String
		let title: String
		let date: Date
		let apiEndpoint: String
		let model: String
		let temperature: Float
		let maxTokens: Int
		let topP: Float
		let frequencyPenalty: Float
		let presencePenalty: Float
		let messages: [Message]
		let systemMessage: String?
		
		init(uuid: String, title: String, date: Date, apiEndpoint: String, model: String, temperature: Float, maxTokens: Int, topP: Float, frequencyPenalty: Float, presencePenalty: Float, messages: [Message], systemMessage: String?) {
			self.uuid = uuid
			self.title = title
			self.date = date
			self.apiEndpoint = apiEndpoint
			self.model = model
			self.temperature = temperature
			self.maxTokens = maxTokens
			self.topP = topP
			self.frequencyPenalty = frequencyPenalty
			self.presencePenalty = presencePenalty
			self.messages = messages
			self.systemMessage = systemMessage
		}
		
		init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			uuid = try container.decode(String.self, forKey: .uuid)
			title = try container.decode(String.self, forKey: .title)
			let dateString = try container.decode(String.self, forKey: .date)
			if let date = try? dateString.iso8601withFractionalSeconds() {
				self.date = date
			} else {
				self.date = Date()
			}
			apiEndpoint = try container.decode(String.self, forKey: .apiEndpoint)
			model = try container.decode(String.self, forKey: .model)
			
			temperature = try Self.fallbackDecode(container, forKey: .temperature, defaultValue: 1)
			maxTokens = Int(try Self.fallbackDecode(container, forKey: .maxTokens, defaultValue: 256))
			topP = try Self.fallbackDecode(container, forKey: .topP, defaultValue: 1)
			frequencyPenalty = try Self.fallbackDecode(container, forKey: .frequencyPenalty, defaultValue: 0)
			presencePenalty = try Self.fallbackDecode(container, forKey: .presencePenalty, defaultValue: 0)
			
			messages = try container.decode([Message].self, forKey: .messages)
			systemMessage = try container.decodeIfPresent(String.self, forKey: .systemMessage)
		}
		
		static func fallbackDecode<Key>(
			_ container: KeyedDecodingContainer<Key>,
			forKey key: KeyedDecodingContainer<Key>.Key,
			defaultValue: Float
		) throws -> Float {
			do {
				return try container.decode(Float.self, forKey: key)
			} catch DecodingError.typeMismatch {
				let string = try container.decode(String.self, forKey: key)
				return Float(string) ?? defaultValue
			}
		}
	}
}
