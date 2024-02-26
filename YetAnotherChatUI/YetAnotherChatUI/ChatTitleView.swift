//
//  ChatTitleView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct ChatTitleView: View {
	@Binding var title: String

	var body: some View {
		HStack {
			Text("Chat title:")
			TextField("Enter chat title", text: $title)
		}
	}
}

#Preview {
	ChatTitleView(title: .constant("Some title"))
}
