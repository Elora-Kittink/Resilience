//
//  BaseViewController.swift
//  Resilience
//
//  Created by Michael Coqueret on 27/06/2022.
//  Copyright © 2022 Exomind. All rights reserved.
//

import Foundation
import UIKit
import Combine
import UtilsKit

class BaseViewController
<
	V: ViewModel,
	P: Presenter<V>,
	I: Interactor<V, P>
>: UIViewController,
   NavigationProtocol{
	
	// MARK: - Variables
	
	private lazy var isRunningUnitTests: Bool = {
		ProcessInfo.processInfo.environment["IS_RUNNING_UNIT_TESTS"] == "true"
	}()
	
	// MARK: Navigation
	var navigationSegue: UtilsKit.Segue?
	var instanceIdentifier: String? { nil }
	var previousViewController: UIViewController?
	
	// MARK: Clean Archi
	var viewModel = V() {
		didSet {
			self.configureViewModel(for: &self.interactor)
		}
	}
	
	lazy var interactor: I = {
		var interactor = I()
		self.configureViewModel(for: &interactor)
		return interactor
	}()
	
	private var subscribers = Set<AnyCancellable>()
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.localize()
	}
	
	func viewWillPresent(controller: UIViewController?, completion: @escaping () -> Void) {
		completion()
	}
	
	// MARK: - Configure
	private func configureViewModel(for interactor: inout I) {
		self.subscribers.removeAll()
		
		self.viewModel.listen(subscribers: &self.subscribers) { [weak self] in
			if self?.isViewLoaded ?? false {
				self?.refreshUI()
			}
		}
		
		self.viewModel.closeListener.listen(subscribers: &self.subscribers) { [weak self] in
			if self?.isViewLoaded ?? false {
				self?.refreshClose()
			}
		}
		
		interactor.set(viewModel: self.viewModel)
	}
	
	// MARK: - Refresh
	func refreshUI() {
		// Refresh UI
	}
	
	private func refreshClose() {
		switch self.viewModel.close.type {
		case .default:
			self.close {
				self.viewModel.close.completion?()
			}
			
		case .dismiss:
			self.dismiss(animated: true) {
				self.viewModel.close.completion?()
			}
			
		case .none:
			break
		}
	}
}
