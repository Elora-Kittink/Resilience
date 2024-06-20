//  DashboardViewController.swift
//
//  Created by Elora on 17/06/2024.
//

import Foundation
import SwiftUI

struct DashboardView: View {
	
	// MARK: - Variables
	private let interactor = DashboardInteractor()
	
	// MARK: State
	@ObservedObject var viewModel: DashboardViewModel
	
	var body: some View {
		NavigationView {
			NavigationLink(destination: TodoListView()) {
				Image(systemName: "list.bullet.rectangle")
			}
		}
	}
	
	init() {
		self.viewModel = .init()
		self.interactor.set(viewModel: self.viewModel)
	}
}


#Preview {
	DashboardView()
}
