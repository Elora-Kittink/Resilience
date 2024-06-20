//  TodoListPresenter.swift
//
//  Created by Elora on 18/06/2024.
//

import Foundation

class TodoListPresenter: Presenter<TodoListViewModel> { 
	
	func displayTitle() {
		self.viewModel?.activeSectionTitle = self.viewModel?.activeList.isEmpty ?? true ? "A faire" : "A faire \(String(describing: self.viewModel?.activeList.count))"
	}
	
	func displayNewTask(task: TodoTask) {
		self.viewModel?.taskList.append(task)
		print("\(self.viewModel?.taskList)")
	}
}
