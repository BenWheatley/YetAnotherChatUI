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
	@ObservedObject var viewModel: ChatSessionViewModel
	@State private var isSettingsVisible = false
	
	var body: some View {
		NavigationView {
			Section(header: Text("My chats")) {
				ChatsListView()
			}
			Section {
				ChatSessionContentView(viewModel: viewModel)
			}
		}
		.listStyle(SidebarListStyle())
		.navigationTitle("Chat session")
		.toolbar {
			ToolbarItem {
				Button(action: {}) {
					Image(systemName: "doc.badge.plus")
						.imageScale(.large)
				}
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
			SettingsView(viewModel: viewModel)
		}
	}
}

#Preview {
	ChatSessionView(viewModel: ChatSessionViewModel())
		.modelContainer(for: ChatSessionViewModel.self, inMemory: true)
}
