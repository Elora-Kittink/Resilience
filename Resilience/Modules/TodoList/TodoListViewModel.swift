//  TodoListViewModel.swift
//
//  Created by Elora on 18/06/2024.
//

class TodoListViewModel: ViewModel { 
	var activeList: [TodoTask] = MockDatas.tasks
	var activeSectionTitle = ""
}
