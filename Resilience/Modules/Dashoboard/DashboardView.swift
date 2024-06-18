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
		Button(action: {
			print("Bouton + appuyé")
		}) {
			Image(systemName: "list.dash.header.rectangle")
				.resizable()
				.frame(width: 60, height: 60)
				.padding()
		}
	}
}


#Preview {
	DashboardView(viewModel: DashboardViewModel())
}

//class DashboardViewController: BaseViewController
//<
//	DashboardViewModel,
//	DashboardPresenter,
//	DashboardInteractor
//> {
//	
//	// MARK: - Outlets
//	
//	// MARK: - Variables
//	
//	// MARK: - View life cycle
//	override func viewDidLoad() {
//		super.viewDidLoad()
//	}
//	
//	// MARK: - Refresh
//	override func refreshUI() {
//		super.refreshUI()
//	}
//
//	// MARK: - Actions
//}
