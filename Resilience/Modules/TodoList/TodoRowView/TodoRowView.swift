//
//  TodoRowView.swift
//  Resilience
//
//  Created by Elora on 18/06/2024.
//

import Foundation
import SwiftUI

struct TodoRowView: View {
	@Binding var task: TodoTask
	@FocusState private var isActive: Bool
	var body: some View {
		HStack(spacing: 8) {
			if !isActive && task.name.isEmpty {
				Button(action: {}, label: {
					Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
						.font(.title2)
						.contentShape(.rect)
						.foregroundStyle(task.isCompleted ? .gray : .primary)
						.contentTransition(.symbolEffect(.replace))
				})
			}
			TextField("Arroser choux", text: $task.name)
				.strikethrough(task.isCompleted)
				.foregroundColor(task.isCompleted ? .gray : .primary)
				.focused($isActive)
			if !isActive && task.name.isEmpty {
				Menu {
					ForEach(TodoTaskPriority.allCases, id: \.rawValue) { priority in
						Button(action: { task.priority = priority }, label: {
							HStack {
								Text(priority.rawValue)
								
								if task.priority == priority { Image("checkmark")}
							}
						})
					}
				} label: {
					Image(systemName: "circle.fill")
						.font(.title2)
						.padding(3)
						.contentShape(.rect)
						.foregroundStyle(task.priority.color.gradient)
				}
			}
		}
		.listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
		.animation(.snappy, value: isActive)
		.onAppear(perform: {
			isActive = task.name.isEmpty
		})
		.onSubmit {
			if task.name.isEmpty {
//				delete task
				
			}
		}
	}
}
