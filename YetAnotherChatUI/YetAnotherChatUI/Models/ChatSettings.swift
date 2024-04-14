//
//  ChatSettings.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 20/03/2024.
//

import Foundation
import SwiftData

@Model
class ChatSettings: ObservableObject, Codable {
	var apiEndpoint: String
	var model: String
	var temperature: Float
	var maxTokens: Int
	var topP: Float
	var frequencyPenalty: Float
	var presencePenalty: Float
	var systemMessage: String
	
	enum CodingKeys: CodingKey {
		case apiEndpoint, model, temperature, maxTokens, topP, frequencyPenalty, presencePenalty, systemMessage
	}
	
	static let defaultSettings = ChatSettings(apiEndpoint: "https://api.openai.com/v1/chat/completions",
											  model: "gpt-4-0125-preview",
											  temperature: 1,
											  maxTokens: 2048,
											  topP: 1,
											  frequencyPenalty: 0,
											  presencePenalty: 0,
											  systemMessage: "You are an AI programming assistant. Follow the user's requirements carefully & to the letter. First think step-by-step - describe your plan for what to build in psuedocode, written out in great detail. Then output the code in a single codeblock. Minimize any other prose. Use the latest version of <relevant platform> you know how. Async/await preferred if you are certain that you can do so. Look out for retain cycles and objects that drop out of memory. If a requirement is not technically possible, tell the user.")
	
	private static let UserDefaultsName = "SettingsModel.savedSettings"
	
	static var savedSettings: ChatSettings {
		let saved = UserDefaults.standard.object(forKey: UserDefaultsName) as? Self
		return saved ?? defaultSettings
	}
	
	required init(apiEndpoint: String, model: String, temperature: Float?, maxTokens: Int?, topP: Float?, frequencyPenalty: Float?, presencePenalty: Float?, systemMessage: String?) {
		self.apiEndpoint = apiEndpoint
		self.model = model
		self.temperature = temperature ?? 1
		self.maxTokens = maxTokens ?? 2048
		self.topP = topP ?? 1
		self.frequencyPenalty = frequencyPenalty ?? 0
		self.presencePenalty = presencePenalty ?? 0
		self.systemMessage = systemMessage ?? ""
	}
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(apiEndpoint, forKey: .apiEndpoint)
		try container.encode(model, forKey: .model)
		try container.encode(temperature, forKey: .temperature)
		try container.encode(maxTokens, forKey: .maxTokens)
		try container.encode(topP, forKey: .topP)
		try container.encode(frequencyPenalty, forKey: .frequencyPenalty)
		try container.encode(presencePenalty, forKey: .presencePenalty)
		try container.encode(systemMessage, forKey: .systemMessage)
	}
	
	required init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		apiEndpoint = try container.decode(String.self, forKey: .apiEndpoint)
		model = try container.decode(String.self, forKey: .model)
		temperature = try container.decode(Float.self, forKey: .temperature)
		maxTokens = try container.decode(Int.self, forKey: .maxTokens)
		topP = try container.decode(Float.self, forKey: .topP)
		frequencyPenalty = try container.decode(Float.self, forKey: .frequencyPenalty)
		presencePenalty = try container.decode(Float.self, forKey: .presencePenalty)
		systemMessage = try container.decode(String.self, forKey: .systemMessage)
	}
	
	func saveToUserDefaults() {
		UserDefaults.standard.set(self, forKey: Self.UserDefaultsName)
	}
}
