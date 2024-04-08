//
//  ChatSettings.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 20/03/2024.
//

import Foundation

struct ChatSettings: Codable {
	var apiEndpoint: String
	var model: String
	var temperature: Float
	var maxTokens: Int
	var topP: Float
	var frequencyPenalty: Float
	var presencePenalty: Float
	var systemMessage: String
	
	static let defaultSettings = Self(apiEndpoint: "https://api.openai.com/v1/chat/completions",
									  model: "gpt-4-0125-preview",
									  temperature: 1,
									  maxTokens: 2048,
									  topP: 1,
									  frequencyPenalty: 0,
									  presencePenalty: 0,
									  systemMessage: "You are an AI programming assistant. Follow the user's requirements carefully & to the letter. First think step-by-step - describe your plan for what to build in psuedocode, written out in great detail. Then output the code in a single codeblock. Minimize any other prose. Use the latest version of <relevant platform> you know how. Async/await preferred if you are certain that you can do so. Look out for retain cycles and objects that drop out of memory. If a requirement is not technically possible, tell the user.")
	
	private static let UserDefaultsName = "SettingsModel.savedSettings"
	
	static var savedSettings: Self {
		let saved = UserDefaults.standard.object(forKey: UserDefaultsName) as? Self
		return saved ?? defaultSettings
	}
	
	func saveToUserDefaults() {
		UserDefaults.standard.set(self, forKey: Self.UserDefaultsName)
	}
}
