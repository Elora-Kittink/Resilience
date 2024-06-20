//
//  CLAView.swift
//  Resilience
//  Created by Thibaud Lambert on 30/05/2024.
//  Copyright © 2024 Exomind. All rights reserved.
//

import SwiftUI

protocol CLAView: View {
	
	associatedtype Model: ViewModel
	
	// MARK: - Variables
	var viewModel: Model { get }
}
