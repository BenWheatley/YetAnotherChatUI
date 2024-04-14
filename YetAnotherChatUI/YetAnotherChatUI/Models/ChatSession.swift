//
//  ChatSession.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import Foundation
import SwiftData

@Model
class ChatSession: ObservableObject, Codable {
	var chatTitle: String
	var messages: [Message]
	var settings: ChatSettings
	var lastModified: Date // TODO: The current version of SwiftData is incompatible with didSet {…}
	@Attribute(.unique) var uuid: UUID = UUID()
	
	init(chatTitle: String = "", messages: [Message] = [], settings: ChatSettings = .savedSettings) {
		self.chatTitle = chatTitle
		self.messages = messages
		self.settings = settings
		self.lastModified = .now
		self.uuid = UUID()
	}
	
	enum CodingKeys: String, CodingKey {
		case chatTitle = "title", messages, settings, lastModified = "date", uuid
	}
	
	enum VariantCodingKeys: String, CodingKey {
		case apiEndpoint, model, temperature, maxTokens, topP, frequencyPenalty, presencePenalty, systemMessage
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(chatTitle, forKey: .chatTitle)
		try container.encode(messages, forKey: .messages)
		try container.encode(settings, forKey: .settings)
		try container.encode(lastModified, forKey: .lastModified)
		try container.encode(uuid, forKey: .uuid)
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		chatTitle = try container.decode(String.self, forKey: .chatTitle)
		messages = try container.decode([Message].self, forKey: .messages)
		do {
			settings = try container.decode(ChatSettings.self, forKey: .settings)
		} catch {
			let variantContainer = try decoder.container(keyedBy: VariantCodingKeys.self)
			let apiEndpoint = try variantContainer.decode(String.self, forKey: .apiEndpoint)
			let model = try variantContainer.decode(String.self, forKey: .model)
			let temperature = Self.castFloatOrNil(try variantContainer.decodeIfPresent(String.self, forKey: .temperature))
			let maxTokens = Self.castIntOrNil(try variantContainer.decodeIfPresent(String.self, forKey: .maxTokens))
			let topP = Self.castFloatOrNil(try variantContainer.decodeIfPresent(String.self, forKey: .topP))
			let frequencyPenalty = Self.castFloatOrNil(try variantContainer.decodeIfPresent(String.self, forKey: .frequencyPenalty))
			let presencePenalty = Self.castFloatOrNil(try variantContainer.decodeIfPresent(String.self, forKey: .presencePenalty))
			let systemMessage = try variantContainer.decodeIfPresent(String.self, forKey: .systemMessage)
			settings = ChatSettings(
				apiEndpoint: apiEndpoint,
				model: model,
				temperature: temperature,
				maxTokens: maxTokens,
				topP: topP,
				frequencyPenalty: frequencyPenalty,
				presencePenalty: presencePenalty,
				systemMessage: systemMessage
			)
		}
		lastModified = (try? container.decode(Date.self, forKey: .lastModified)) ?? .now
		uuid = (try? container.decode(UUID.self, forKey: .uuid)) ?? UUID()
	}
	
	// I've not yet been able to rewrite these to use generics
	static func castFloatOrNil(_ value: String?) -> Float? {
		if let value = value { return Float(value) }
		return nil
	}
	
	static func castIntOrNil(_ value: String?) -> Int? {
		if let value = value { return Int(value) }
		return nil
	}
}
