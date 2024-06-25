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
	@ObservedObject var viewModel = TodoListViewModel()
	
	var body: some View {
		VStack {
			List {
				Section(self.viewModel.activeSectionTitle) {
					ForEach(viewModel.activeTaskList, id: \.id) { task in
						let index = self.viewModel.activeTaskList.firstIndex(of: task) ?? 0
						TodoRowView(task: $viewModel.activeTaskList[index])
					}
				}
				
				Section("Done") {
					ForEach(self.viewModel.doneTaskList, id: \.id) { task in
						let index = self.viewModel.doneTaskList.firstIndex(of: task) ?? 0
						TodoRowView(task: $viewModel.doneTaskList[index])
					}
				}
			}
			.transition(.slide)
			.onChange(of: self.viewModel.activeTaskList) {
				self.interactor.refresh()
			}
			.onChange(of: self.viewModel.doneTaskList) {
				self.interactor.refresh()
			}
			
			Spacer(minLength: 32)
			
			Button(action: {
				self.interactor.createNewTask()
			}) {
				Image(systemName: "plus.circle.fill").font(.system(.largeTitle))
			}
		}
		.onAppear {
			self.interactor.refresh()
		}
	}
	
	init() {
		self.interactor.set(viewModel: self.viewModel)
	}
}

#Preview {
	TodoListView()
}
