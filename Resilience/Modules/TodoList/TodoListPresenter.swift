//  TodoListPresenter.swift
//
//  Created by Elora on 18/06/2024.
//

import Foundation

class TodoListPresenter: Presenter<TodoListViewModel> {
	
	func displayTitle() {
		self.viewModel?.activeSectionTitle = self.viewModel?.activeTaskList.isEmpty ?? true ? "A faire" : "A faire - \( self.viewModel?.activeTaskList.count ?? 0)"
	}
	
	func displayTodoList() {
		let allTask = (self.viewModel?.activeTaskList ?? []) + (self.viewModel?.doneTaskList ?? [])
		
		let activeList = allTask.filter {
			!$0.isCompleted
		}
			.sorted {
				$0.priority.sortedOrder > $1.priority.sortedOrder
			}
		
		let doneList = allTask.filter {
			$0.isCompleted
		}
		
		self.viewModel?.activeTaskList = activeList
		self.viewModel?.doneTaskList = doneList
	}
	
	func displayNewTask(task: TodoTask) {
		self.viewModel?.activeTaskList.insert(task, at: 0)
	}
}
