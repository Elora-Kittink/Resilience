//  TodoListPresenter.swift
//
//  Created by Elora on 18/06/2024.
//

class TodoListPresenter: Presenter<TodoListViewModel> { 
	
	func displayTitle() {
		self.viewModel?.activeSectionTitle = self.viewModel?.activeList.isEmpty ?? true ? "A faire" : "A faire \(String(describing: self.viewModel?.activeList.count))"
	}
}
