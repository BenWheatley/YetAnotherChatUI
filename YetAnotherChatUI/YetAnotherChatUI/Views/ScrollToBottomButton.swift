//
//  ScrollToBottomButton.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct ScrollToBottomButton: View {
	var body: some View {
		Button(action: {
			print("pressed")
		}) {
			Image(systemName: "arrow.down.circle.fill")
				.imageScale(.large)
		}
		.padding()
		.buttonStyle(PlainButtonStyle())
	}
}

#Preview {
    ScrollToBottomButton()
}
