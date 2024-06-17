//
//  ViewModel.swift
//  Resilience
//
//  Created by Michael Coqueret on 27/06/2022.
//  Copyright © 2022 Exomind. All rights reserved.
//

import Combine

enum CloseType {
	
	case `default`,
		 dismiss,
		 none
}

class ViewModel: ObservableObject {
	
	class Listener<T>: ObservableObject {
		var value: T
		
		init(_ value: T) {
			self.value = value
		}
	}
	
	// MARK: - Variables
	
	// Loading
	private(set) var loaderListener = Listener<(Bool, String?)>((false, nil))
	var loading: (Bool, message: String?) {
		get { self.loaderListener.value }
		set {
			self.loaderListener.value = newValue
			self.loaderListener.objectWillChange.send()
		}
	}
	
	// Close
	private(set) var closeListener = Listener<(CloseType, (() -> Void)?)>((.none, nil))
	var close: (type: CloseType, completion: (() -> Void)?) {
		get { self.closeListener.value }
		set {
			self.closeListener.value = newValue
			self.closeListener.objectWillChange.send()
		}
	}
	
	// MARK: - Init
	required init() {
		// Required Init
	}
}
