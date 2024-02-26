//
//  GDPRView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 26/02/2024.
//

import SwiftUI

struct GDPRView: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
			Text("GDPR stuff")
				.font(.title)
			
			Text("This is intended for technical users only, who understand what all this stuff is and how it works.")
			Text("Your data is stored on your device, it is not shared at this time.")
			Text("Your data is sent to and processed by whoever controls the URL specified in 'API endpoint' (which you can specify yourself) when you press the 'Enter' button. I don't know what they do with it, you should ask them, and if you don't like their answer use a different API provider instead.")
		}
	}
}

#Preview {
    GDPRView()
}
