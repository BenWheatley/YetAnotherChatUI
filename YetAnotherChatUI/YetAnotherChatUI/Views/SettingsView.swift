//
//  SettingsView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var settings: ChatSettings
	@Environment(\.dismiss) var dismiss
	
	let formatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		return formatter
	}()
	
	var body: some View {
		VStack {
			HStack {
				HStack {
					Spacer()
					Text("Settings")
						.font(.title)
					Spacer()
				}
				
				Button(action: dismiss.callAsFunction) {
					Image(systemName: "xmark.circle.fill")
						.foregroundColor(.gray)
				}.buttonStyle(BorderlessButtonStyle())
			}
			
			Text("These are for technical users")
				.frame(maxWidth: .infinity, alignment: .leading)
			
			Grid {
				GridRow {
					Text("API Endpoint:")
					TextField("", text: $settings.apiEndpoint)
				}
				GridRow {
					Text("Model:")
					TextField("", text: $settings.model)
				}
				GridRow {
					Text("Temperature:")
					Slider(value: $settings.temperature, in: 0...5)
					Text("\(settings.temperature)")
				}
				GridRow {
					Text("Maximum number of tokens:")
					TextField("", value: $settings.maxTokens, formatter: formatter)
				}
				GridRow {
					Text("top_p:")
					Slider(value: $settings.topP, in: 0...1)
					Text("\(settings.topP)")
				}
				GridRow {
					Text("Frequency penalty:")
					Slider(value: $settings.frequencyPenalty, in: -2.0...2.0)
					Text("\(settings.frequencyPenalty)")
				}
				GridRow {
					Text("Presence penalty:")
					Slider(value: $settings.presencePenalty, in: -2.0...2.0)
					Text("\(settings.presencePenalty)")
				}
				GridRow {
					Text("System message:")
					TextEditor(text: $settings.systemMessage)
						.frame(height: 140)
					
				}
			}
		}
		.padding()
		.frame(width: 640)
	}
}

#Preview {
	SettingsView(settings: .defaultSettings)
}
