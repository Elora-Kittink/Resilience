//
//  HostingViewController.swift
//  Pluxee FR
//
//  Created by Thibaud Lambert on 30/05/2024.
//  Copyright © 2024 Exomind. All rights reserved.
//

import Foundation
import UtilsKit
import SwiftUI
import Combine

class HostingViewController<Content: CLAView>: UIHostingController<Content>,
											NavigationProtocol {
	
	// MARK: - Variables
	private var subscribers = Set<AnyCancellable>()
	
	var leftTitleLabel: UILabel?
	override var title: String? {
		didSet {
			self.leftTitleLabel?.text = self.title
		}
	}
	
	// MARK: Navigation
	var navigationSegue: UtilsKit.Segue?
	var instanceIdentifier: String?
	var previousViewController: UIViewController?
	
	// MARK: - Init
	override init(rootView: Content) {
		super.init(rootView: rootView)
		self.configureViewModel(viewModel: rootView.viewModel)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
		log(.deinit, "Deinit \(String(describing: self))")
	}
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
	
		self.view.localize()
	}
	
	func viewWillPresent(controller: UIViewController?, completion: @escaping () -> Void) {
		completion()
	}
	
	// MARK: - Configure
	private func configureViewModel(viewModel: ViewModel) {
		self.subscribers.removeAll()
		
		viewModel.closeListener.listen(subscribers: &self.subscribers) { [weak self] in
			if self?.isViewLoaded ?? false {
				self?.refreshClose(viewModel: viewModel)
			}
		}
	}
	
	private func refreshClose(viewModel: ViewModel) {
		switch viewModel.close.type {
		case .default:
			self.close {
				viewModel.close.completion?()
			}
			
		case .dismiss:
			self.dismiss(animated: true) {
				viewModel.close.completion?()
			}
			
		case .none:
			break
		}
	}
}
