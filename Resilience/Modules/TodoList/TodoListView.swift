//  TodoListViewController.swift
//
//  Created by Elora on 18/06/2024.
//

import SwiftUI

struct TodoListView: View {
	
	// MARK: - Variables
	private let interactor = TodoListInteractor()
	
	// MARK: State
	@ObservedObject var viewModel: TodoListViewModel
	
	var body: some View {
		List {
			Section(self.viewModel.activeSectionTitle) {
				ForEach(self.viewModel.activeList.indices, id: \.self) { index in
					TodoRowView(task: $viewModel.activeList[index])
				}
			}
		}
		.toolbar {
			ToolbarItem(placement: .bottomBar) {
				Button(action: {
					print("nouvelle task !")
				}, label: {
					Image(systemName: "plus")
						.font(.system(size: 42))
				})
			}
		}
	}
}

#Preview {
	TodoListView(viewModel: TodoListViewModel())
}
