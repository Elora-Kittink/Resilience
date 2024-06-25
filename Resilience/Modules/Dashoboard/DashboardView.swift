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
	@State private var showSheet = false
	@State private var fullScreen = false
	
	var body: some View {
//		NavigationView {
//			NavigationLink(destination: TodoListView()) {
//				Image(systemName: "list.bullet.rectangle")
//			}
//		}
		Button(action: {
			showSheet.toggle()
		}) {
			Image(systemName: "list.bullet.rectangle")
		}.sheet(isPresented: $showSheet) {
			TodoListView()
		}
//		Button(action: {
//			fullScreen.toggle()
//		}) {
//			Image(systemName: "list.bullet.rectangle")
//		}.fullScreenCover(isPresented: $fullScreen) {
//			TodoListView()
//		}
	}
	
	init() {
		self.viewModel = .init()
		self.interactor.set(viewModel: self.viewModel)
	}
}


#Preview {
	DashboardView()
}
