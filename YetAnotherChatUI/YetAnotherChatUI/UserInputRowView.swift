//
//  UserInputRowView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct UserInputRowView: View {
	@Binding var message: String

	var body: some View {
		HStack {
			TextEditor(text: $message)
				.frame(minHeight: 30)
				.border(Color.gray)
			Button(action: {}) {
				Text("Enter")
					.padding()
					.background(Color.green)
					.foregroundColor(.white)
					.cornerRadius(5)
			}
		}
	}
}

#Preview {
	UserInputRowView(message: .constant("some message"))
}
