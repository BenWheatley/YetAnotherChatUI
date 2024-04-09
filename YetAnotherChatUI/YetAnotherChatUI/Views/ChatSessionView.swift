//
//  ContentView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI
import SwiftData

import SwiftUI

struct ChatSessionView: View {
	@Query(sort: \ChatSession.lastModified) var listOfChats: [ChatSession]

	@State private var isSettingsVisible = false
	
	@Environment(\.modelContext) private var swiftDataModelContext
	
	var body: some View {
		NavigationView {
			Section(header: Text("My chats")) {
				ChatsListView()
			}
			Section {
				let mostRecentlyEditedChat = listOfChats.first ?? makeNewChatSession()
				ChatSessionContentView(viewModel: mostRecentlyEditedChat)
			}
		}
		.listStyle(SidebarListStyle())
		.navigationTitle("Chat session")
		.toolbar {
			ToolbarItem {
				Button(action: { _ = makeNewChatSession() }, label: {
					Image(systemName: "doc.badge.plus")
						.imageScale(.large)
				})
			}
			ToolbarItem {
				Button(action: {
					isSettingsVisible.toggle()
				}) {
					Image(systemName: "gearshape")
						.imageScale(.large)
				}
			}
		}
		.sheet(isPresented: $isSettingsVisible) {
			if let mostRecentlyEditedChat = listOfChats.first {
				SettingsView(settings: mostRecentlyEditedChat.settings)
			}
		}
	}
	
	func makeNewChatSession() -> ChatSession {
		let chatSession = ChatSession(chatTitle: "New chat", messages: [], settings: .savedSettings)
		swiftDataModelContext.insert(chatSession)
		return chatSession
	}
}

#Preview {
	ChatSessionView()
		.modelContainer(for: ChatSession.self, inMemory: true)
}
