//
//  YetAnotherChatUIApp.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI
import SwiftData

@main
struct YetAnotherChatUIApp: App {
	var sharedModelContainer: ModelContainer = {
		let schema = Schema([
			ChatSession.self
		])
		let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
		
		do {
			return try ModelContainer(for: schema, configurations: [modelConfiguration])
		} catch {
			fatalError("Could not create ModelContainer: \(error)")
		}
	}()
	
	var body: some Scene {
		WindowGroup {
			ChatSessionView()
		}
		.modelContainer(sharedModelContainer)
	}
}
