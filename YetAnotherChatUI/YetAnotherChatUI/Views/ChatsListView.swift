//
//  ChatsListView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI
import SwiftData

struct ChatsListView: View {
	@Query(sort: \ChatSession.lastModified) var listOfChats: [ChatSession]
	var body: some View {
		VStack {
			List {
				ForEach(listOfChats.indices, id: \.self) { index in
					ChatListRowView(chat: listOfChats[index])
				}
			}
		}
	}
}

#Preview {
	ChatsListView()
}
