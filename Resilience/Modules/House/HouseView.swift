//  HouseViewController.swift
//
//  Created by Elora on 17/06/2024.
//

import SwiftUI

struct HouseView: CLAView {
	
	// MARK: - Variables
	private let interactor = HouseInteractor()

	//	MARK: - State
	@ObservedObject var viewModel: HouseViewModel
	
	var body: some View {
		Text("House view")
	}
	
	init() {
		self.viewModel = .init()
		self.interactor.set(viewModel: self.viewModel)
	}
}
