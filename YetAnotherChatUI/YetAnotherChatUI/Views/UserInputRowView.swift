//
//  UserInputRowView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct UserInputRowView: View {
	@State var message: String = ""

	var body: some View {
		HStack(alignment: .bottom) {
			TextEditor(text: $message)
				.frame(minHeight: 30, maxHeight: 100)
				.fixedSize(horizontal: false, vertical: true)
				.border(.gray)
			
			Button(action: {
				print("pressed")
			}) {
				Image(systemName: "arrow.right.circle.fill")
					.imageScale(.large)
			}
			.buttonStyle(PlainButtonStyle())
		}
	}
}

#Preview {
	UserInputRowView()
}
