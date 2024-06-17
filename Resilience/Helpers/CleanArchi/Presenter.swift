//
//  Presenter.swift
//  Resilience
//
//  Created by Michael Coqueret on 27/06/2022.
//  Copyright © 2022 Exomind. All rights reserved.
//

import Foundation

class Presenter<V: ViewModel> {
	
	// MARK: Variables
	private let identifier = UUID().uuidString
	var viewModel: V?
	
	// MARK: - Init
	required init() {
		// Required Init
	}
	
	func set(viewModel: V) {
		self.viewModel = viewModel
	}
	
	// MARK: - Display
	func display() {
		self.viewModel?.objectWillChange.send()
	}
	
	// MARK: Loading
	func display(loader: Bool, message: String? = nil) {
		self.viewModel?.loading = (loader, message)
	}
	
	// MARK: Close
	func close(_ type: CloseType = .default, completion: (() -> Void)? = nil) {
		self.viewModel?.close = (type, completion)
	}
}
