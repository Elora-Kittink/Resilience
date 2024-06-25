//  TodoListViewModel.swift
//
//  Created by Elora on 18/06/2024.
//

import SwiftUI

class TodoListViewModel: ViewModel {
	
	var list: [TodoTask] = MockDatas.tasks
	
	@Published var doneTaskList: [TodoTask] = MockDatas.tasks.filter { $0.isCompleted }
	@Published var activeTaskList: [TodoTask] = MockDatas.tasks.filter { !$0.isCompleted }
	var activeSectionTitle = ""
}
