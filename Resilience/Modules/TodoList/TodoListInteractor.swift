//  TodoListInteractor.swift
//
//  Created by Elora on 18/06/2024.
//

import Foundation

class TodoListInteractor: Interactor
<
	TodoListViewModel,
	TodoListPresenter
> {
	func refresh() {
		self.presenter.displayTitle()
		self.presenter.displayTodoList()
	}
	
	func createNewTask() {
		let newTask = TodoTask(id: UUID().uuidString, name: "", isCompleted: false, priority: .high)
		self.presenter.displayNewTask(task: newTask)
	}
}
