//
//  SettingsView.swift
//  YetAnotherChatUI
//
//  Created by Ben Wheatley on 25/02/2024.
//

import SwiftUI

struct SettingsView: View {
	@ObservedObject var viewModel: ChatSessionViewModel
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
					TextField("", text: $viewModel.settings.apiEndpoint)
				}
				GridRow {
					Text("Model:")
					TextField("", text: $viewModel.settings.model)
				}
				GridRow {
					Text("Temperature:")
					Slider(value: $viewModel.settings.temperature, in: 0...5)
					Text("\(viewModel.settings.temperature)")
				}
				GridRow {
					Text("Maximum number of tokens:")
					TextField("", value: $viewModel.settings.maxTokens, formatter: formatter)
				}
				GridRow {
					Text("top_p:")
					Slider(value: $viewModel.settings.topP, in: 0...1)
					Text("\(viewModel.settings.topP)")
				}
				GridRow {
					Text("Frequency penalty:")
					Slider(value: $viewModel.settings.frequencyPenalty, in: -2.0...2.0)
					Text("\(viewModel.settings.frequencyPenalty)")
				}
				GridRow {
					Text("Presence penalty:")
					Slider(value: $viewModel.settings.presencePenalty, in: -2.0...2.0)
					Text("\(viewModel.settings.presencePenalty)")
				}
				GridRow {
					Text("System message:")
					TextEditor(text: $viewModel.settings.systemMessage)
						.frame(height: 140)
					
				}
			}
		}
		.padding()
		.frame(width: 640)
	}
}

#Preview {
	SettingsView(viewModel: ChatSessionViewModel())
}
