//  DashboardViewController.swift
//
//  Created by Elora on 17/06/2024.
//

import Foundation
import SwiftUI

struct DashboardView: View {
	var body: some View {
		Button(action: {
			print("Bouton + appuyé")
		}) {
			Image(systemName: "plus")
				.resizable()
				.frame(width: 20, height: 20)
				.padding()
		}
	}
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
