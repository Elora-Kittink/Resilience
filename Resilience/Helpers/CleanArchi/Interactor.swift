//
//  Interactor.swift
//  Resilience
//
//  Created by Michael Coqueret on 27/06/2022.
//  Copyright © 2022 Exomind. All rights reserved.
//

class Interactor
<
	V: ViewModel,
	P: Presenter<V>
> {
	
	// MARK: - Variables
	let presenter: P
	
	// MARK: - Init
	required init() {
		self.presenter = P()
	}
	
	func set(viewModel: V) {
		self.presenter.set(viewModel: viewModel)
	}
}
