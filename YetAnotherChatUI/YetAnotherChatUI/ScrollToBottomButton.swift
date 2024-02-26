//
//  ScrollToBottomButton.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct ScrollToBottomButton: View {
	var body: some View {
		Button(action: {}) {
			Image(systemName: "arrow.down.circle.fill")
				.resizable()
				.frame(width: 40, height: 40)
				.background(Color.white)
				.clipShape(Circle())
				.overlay(Circle().stroke(Color.gray, lineWidth: 1))
		}
		.padding(.bottom, 20)
		.transition(.opacity)
	}
}

#Preview {
    ScrollToBottomButton()
}
