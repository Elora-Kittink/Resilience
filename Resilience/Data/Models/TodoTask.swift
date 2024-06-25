//
//  TodoTask.swift
//  Resilience
//
//  Created by Elora on 18/06/2024.
//

import Foundation

struct TodoTask: Equatable, Hashable {
	let id: String
	var name: String
	var isCompleted: Bool
	var priority: TodoTaskPriority
}
