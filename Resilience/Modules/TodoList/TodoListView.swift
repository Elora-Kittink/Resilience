//  TodoListViewController.swift
//
//  Created by Elora on 18/06/2024.
//

import SwiftUI
import SwiftData

struct TodoListView: CLAView {
	
	// MARK: - Variables
	private let interactor = TodoListInteractor()
	
	// MARK: State
	@ObservedObject var viewModel: TodoListViewModel
	
	var body: some View {
		List {
			Section(self.viewModel.activeSectionTitle) {
				ForEach(viewModel.taskList.indices.filter { !viewModel.taskList[$0].isCompleted }, id: \.self) { index in
					TodoRowView(task: $viewModel.taskList[index])
					
				}
			}
			Section("Done") {
				ForEach(self.viewModel.taskList.indices.filter { self.viewModel.taskList[$0].isCompleted }, id: \.self) { index in
					TodoRowView(task: $viewModel.taskList[index])
				}
			}
		}
		
		Spacer()
		
		Button(action: {
			self.interactor.createNewTask()
		}) {
			Image(systemName: "plus")
				.resizable()
				.frame(width: 20, height: 20)
				.padding()
		}
	}
	
	init() {
		self.viewModel = .init()
		self.interactor.set(viewModel: self.viewModel)
		self.interactor.refresh()
	}
}

#Preview {
	TodoListView()
}
