//
//  ChatSessionViewModel.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import Foundation

class ChatSessionViewModel: ObservableObject {
	@Published var isChatsListVisible: Bool = true
	@Published var isSettingsVisible: Bool = true
	@Published var chatTitle: String = ""
	@Published var userMessage: String = ""
	@Published var isScrollToBottomVisible: Bool = false
}
