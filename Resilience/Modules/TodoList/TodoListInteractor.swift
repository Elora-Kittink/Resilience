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
	}
	
	func createNewTask() {
		let newTask = TodoTask(id: UUID().uuidString, name: "", isCompleted: false, priority: .normal)
		self.presenter.displayNewTask(task: newTask)
	}
}
