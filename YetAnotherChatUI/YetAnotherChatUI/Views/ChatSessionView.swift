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
	@Query(sort: \ChatSession.lastModified, order: .reverse) var listOfChats: [ChatSession]

	@State private var selectedChat: ChatSession?
	@State private var isSettingsVisible = false
	
	@Environment(\.modelContext) private var swiftDataModelContext
	
	var body: some View {
		NavigationSplitView {
			VStack {
				Text("My chats")
					.font(.title)
				
				HStack {
					Button(action: importData, label: {
						Image(systemName: "square.and.arrow.down.on.square")
							.padding(5)
					}).padding()
					
					Spacer()
					
					Button(action: exportData, label: {
						Image(systemName: "square.and.arrow.up.on.square")
							.padding(5)
					}).padding()
				}
				
				List(listOfChats, selection: $selectedChat) { chat in
					ChatListRowView(chat: chat)
						.onTapGesture {
							chat.lastModified = .now
							selectedChat = chat
						}
				}
				.navigationSplitViewColumnWidth(240)
			}
			
		} detail: {
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
			if let selectedChat = selectedChat {
				SettingsView(settings: selectedChat.settings)
			}
		}
	}
	
	func makeNewChatSession() -> ChatSession {
		let chatSession = ChatSession(chatTitle: "New chat", messages: [], settings: .savedSettings)
		swiftDataModelContext.insert(chatSession)
		return chatSession
	}
	
	func importData() {
		let importPanel = NSOpenPanel()
		importPanel.allowedContentTypes = [.json]
		importPanel.canChooseFiles = true
		importPanel.canChooseDirectories = false
		
		importPanel.begin { response in
			guard response == .OK, let url = importPanel.url else { return }
			
			do {
				let data = try Data(contentsOf: url)
				let decoder = JSONDecoder()
				let importedFromWeb = try decoder.decode(WebChats.self, from: data)
				let appChats = importedFromWeb.convertToAppModel()
				appChats.forEach { c in
					print(c.chatTitle)
					swiftDataModelContext.insert(c)
				}
				
			} catch {
				print("Error importing data: \(error.localizedDescription)")
			}
		}
	}
	
	func exportData() {
		let exportPanel = NSSavePanel()
		exportPanel.allowedContentTypes = [.json]
		
		exportPanel.begin { response in
			guard response == .OK, let url = exportPanel.url else { return }
			
			do {
				let encoder = JSONEncoder()
				let data = try encoder.encode(WebChats(source: self.listOfChats))
				try data.write(to: url)
			} catch {
				print("Error exporting data: \(error.localizedDescription)")
			}
		}
	}
}

#Preview {
	ChatSessionView()
		.modelContainer(for: ChatSession.self, inMemory: true)
}
