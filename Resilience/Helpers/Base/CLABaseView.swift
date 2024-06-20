//
//  CLABaseView.swift
//  Resilience
//
//  Created by Michael Coqueret on 26/07/2021.
//  Copyright © 2021 Exomind. All rights reserved.
//

import Foundation
import UIKit
import UtilsKit
import Combine

class CLABaseView<V: ViewModel, P: Presenter<V>, I: Interactor<V, P>>: BaseView {
	
	// MARK: - Variables
	// MARK: Clean Archi
	let viewModel = V()
	
	lazy var interactor: I = {
		var interactor = I()
		self.configureViewModel(for: &interactor)
		return interactor
	}()
	
	private var subscribers = Set<AnyCancellable>()
	
	// MARK: - Init
	deinit {
		NotificationCenter.default.removeObserver(self)
		log(.deinit, "Deinit \(String(describing: self))")
	}
	
	// MARK: - Configure viewModel
	private func configureViewModel(for interactor: inout I) {
		self.subscribers.removeAll()
		
		self.viewModel.listen(subscribers: &self.subscribers) { [weak self] in
			self?.refreshUI()
		}
		
		interactor.set(viewModel: self.viewModel)
	}
	
	// MARK: - Refresh
	func refreshUI() {
		// Refresh UI
	}
}
