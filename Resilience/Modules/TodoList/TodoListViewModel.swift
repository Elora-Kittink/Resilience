//  TodoListViewModel.swift
//
//  Created by Elora on 18/06/2024.
//

import SwiftUI

class TodoListViewModel: ViewModel {
	@Published var taskList: [TodoTask] = MockDatas.tasks
	var activeList: [TodoTask] = []
	var activeSectionTitle = "erjhd"
}
